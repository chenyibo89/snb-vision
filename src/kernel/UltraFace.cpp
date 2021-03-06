//
//  UltraFace.cpp
//  UltraFaceTest
//
//  Created by vealocia on 2019/10/17.
//  Copyright © 2019 vealocia. All rights reserved.
//

#define clip(x, y) (x < 0 ? 0 : (x > y ? y : x))

#include "UltraFace.h"
#include "../utils/INIReader.h"
#include "ncnn/mat.h"
#include "../utils/snowboy_logging.h"
#include <string>
#include <iostream>

namespace duerVision {

UltraFace::UltraFace(const char *model_dir, const char *config_filename) {
    std::string config_full_path = std::string(model_dir) + "/" + std::string(config_filename);
    INIReader reader(config_full_path.c_str());
    if (reader.ParseError() < 0) {
        return;
    }
    std::string bin_path = std::string(model_dir).append("/") +
                           reader.Get("model", "ncnn_bin", "");
    std::string param_path = std::string(model_dir).append("/") +
                             reader.Get("model", "ncnn_param", "");
    int input_width = reader.GetInteger("setting", "input_width", 320);
    int input_length = reader.GetInteger("setting", "input_length", 240);
    int num_thread_ = reader.GetInteger("setting", "num_thread", 1);
    float score_threshold_ = reader.GetReal("setting", "score_threshold_", 0.7);
    float iou_threshold_ = reader.GetReal("setting", "iou_threshold", 0.3);

    num_thread = num_thread_;
    score_threshold = score_threshold_;
    iou_threshold = iou_threshold_;
    in_w = input_width;
    in_h = input_length;
    w_h_list = {in_w, in_h};

    for (auto size : w_h_list) {
        std::vector<float> fm_item;
        for (float stride : strides) {
            fm_item.push_back(ceil(size / stride));
        }
        featuremap_size.push_back(fm_item);
    }

    for (auto size : w_h_list) {
        shrinkage_size.push_back(strides);
    }

    /* generate prior anchors */
    for (int index = 0; index < num_featuremap; index++) {
        float scale_w = in_w / shrinkage_size[0][index];
        float scale_h = in_h / shrinkage_size[1][index];
        for (int j = 0; j < featuremap_size[1][index]; j++) {
            for (int i = 0; i < featuremap_size[0][index]; i++) {
                float x_center = (i + 0.5) / scale_w;
                float y_center = (j + 0.5) / scale_h;

                for (float k : min_boxes[index]) {
                    float w = k / in_w;
                    float h = k / in_h;
                    priors.push_back({clip(x_center, 1), clip(y_center, 1), clip(w, 1), clip(h, 1)});
                }
            }
        }
    }
    num_anchors = priors.size();
    /* generate prior anchors finished */

    ultraface.load_param(param_path.data());
    ultraface.load_model(bin_path.data());
    b_initialized = true;
}


UltraFace::~UltraFace() { ultraface.clear(); }

int UltraFace::detect(const unsigned char *pixel_array, int w, int h, int type,
        std::vector<FaceInfo> &face_list) const {
    if (type != ncnn::Mat::PIXEL_RGB && type != ncnn::Mat::PIXEL_BGR ) {
        SNOWBOY_LOG(LogLevel::WARNING) << "image should be rgb format" << std::endl;
        return -1;
    }
    ncnn::Mat img = ncnn::Mat::from_pixels_resize(pixel_array, type, w, h, in_w, in_h);
    return detect(img, face_list, w, h);
}

int UltraFace::detect(ncnn::Mat &img, std::vector<FaceInfo> &face_list,
        int ori_w, int ori_h) const {
    if (img.empty()) {
        std::cout << "image is empty ,please check!" << std::endl;
        return -1;
    }

    printf("img.h = %d, img.w = %d\n", img.h, img.w);

    ncnn::Mat ncnn_img;
    if (img.h != in_h && img.w != in_w) {
        ncnn::resize_bilinear(img, ncnn_img, in_w, in_h);
    } else {
        ncnn_img = img;
    }

    ncnn_img.substract_mean_normalize(mean_vals, norm_vals);

    std::vector<FaceInfo> bbox_collection;
    std::vector<FaceInfo> valid_input;

    ncnn::Extractor ex = ultraface.create_extractor();
    ex.set_num_threads(num_thread);
    ex.input("input", ncnn_img);

    ncnn::Mat scores;
    ncnn::Mat boxes;
    ex.extract("scores", scores);
    ex.extract("boxes", boxes);
    generateBBox(bbox_collection, scores, boxes, score_threshold, num_anchors, ori_w, ori_h);
    nms(bbox_collection, face_list);
    return 0;
}

void UltraFace::generateBBox(std::vector<FaceInfo> &bbox_collection, ncnn::Mat scores, ncnn::Mat boxes,
                             float score_threshold, int num_anchors, int ori_w, int ori_h) const {
    for (int i = 0; i < num_anchors; i++) {
        if (scores.channel(0)[i * 2 + 1] > score_threshold) {
            FaceInfo rects;
            float x_center = boxes.channel(0)[i * 4] * center_variance * priors[i][2] + priors[i][0];
            float y_center = boxes.channel(0)[i * 4 + 1] * center_variance * priors[i][3] + priors[i][1];
            float w = exp(boxes.channel(0)[i * 4 + 2] * size_variance) * priors[i][2];
            float h = exp(boxes.channel(0)[i * 4 + 3] * size_variance) * priors[i][3];

            rects.x1 = clip(x_center - w / 2.0, 1) * ori_w;
            rects.y1 = clip(y_center - h / 2.0, 1) * ori_h;
            rects.x2 = clip(x_center + w / 2.0, 1) * ori_w;
            rects.y2 = clip(y_center + h / 2.0, 1) * ori_h;
            rects.score = clip(scores.channel(0)[i * 2 + 1], 1);
            bbox_collection.push_back(rects);
        }
    }
}

void UltraFace::nms(std::vector<FaceInfo> &input, std::vector<FaceInfo> &output, int type) const {
    std::sort(input.begin(), input.end(), [](const FaceInfo &a, const FaceInfo &b) { return a.score > b.score; });

    int box_num = input.size();

    std::vector<int> merged(box_num, 0);

    for (int i = 0; i < box_num; i++) {
        if (merged[i])
            continue;
        std::vector<FaceInfo> buf;

        buf.push_back(input[i]);
        merged[i] = 1;

        float h0 = input[i].y2 - input[i].y1 + 1;
        float w0 = input[i].x2 - input[i].x1 + 1;

        float area0 = h0 * w0;

        for (int j = i + 1; j < box_num; j++) {
            if (merged[j])
                continue;

            float inner_x0 = input[i].x1 > input[j].x1 ? input[i].x1 : input[j].x1;
            float inner_y0 = input[i].y1 > input[j].y1 ? input[i].y1 : input[j].y1;

            float inner_x1 = input[i].x2 < input[j].x2 ? input[i].x2 : input[j].x2;
            float inner_y1 = input[i].y2 < input[j].y2 ? input[i].y2 : input[j].y2;

            float inner_h = inner_y1 - inner_y0 + 1;
            float inner_w = inner_x1 - inner_x0 + 1;

            if (inner_h <= 0 || inner_w <= 0)
                continue;

            float inner_area = inner_h * inner_w;

            float h1 = input[j].y2 - input[j].y1 + 1;
            float w1 = input[j].x2 - input[j].x1 + 1;

            float area1 = h1 * w1;

            float score;

            score = inner_area / (area0 + area1 - inner_area);

            if (score > iou_threshold) {
                merged[j] = 1;
                buf.push_back(input[j]);
            }
        }
        switch (type) {
            case hard_nms: {
                output.push_back(buf[0]);
                break;
            }
            case blending_nms: {
                float total = 0;
                for (int i = 0; i < buf.size(); i++) {
                    total += exp(buf[i].score);
                }
                FaceInfo rects;
                memset(&rects, 0, sizeof(rects));
                for (int i = 0; i < buf.size(); i++) {
                    float rate = exp(buf[i].score) / total;
                    rects.x1 += buf[i].x1 * rate;
                    rects.y1 += buf[i].y1 * rate;
                    rects.x2 += buf[i].x2 * rate;
                    rects.y2 += buf[i].y2 * rate;
                    rects.score += buf[i].score * rate;
                }
                output.push_back(rects);
                break;
            }
            default: {
                printf("wrong type of nms.");
                exit(-1);
            }
        }
    }
}

}