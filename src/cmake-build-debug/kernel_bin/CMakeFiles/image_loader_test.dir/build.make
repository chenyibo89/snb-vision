# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/eclair/workspace/code/git/snb-vision/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug

# Include any dependencies generated for this target.
include kernel_bin/CMakeFiles/image_loader_test.dir/depend.make

# Include the progress variables for this target.
include kernel_bin/CMakeFiles/image_loader_test.dir/progress.make

# Include the compile flags for this target's objects.
include kernel_bin/CMakeFiles/image_loader_test.dir/flags.make

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o: kernel_bin/CMakeFiles/image_loader_test.dir/flags.make
kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o: ../kernel_bin/image_loader_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o -c /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader_test.cpp

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_loader_test.dir/image_loader_test.cpp.i"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader_test.cpp > CMakeFiles/image_loader_test.dir/image_loader_test.cpp.i

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_loader_test.dir/image_loader_test.cpp.s"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader_test.cpp -o CMakeFiles/image_loader_test.dir/image_loader_test.cpp.s

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.o: kernel_bin/CMakeFiles/image_loader_test.dir/flags.make
kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.o: ../kernel_bin/image_loader.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.o"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/image_loader_test.dir/image_loader.cpp.o -c /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader.cpp

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_loader_test.dir/image_loader.cpp.i"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader.cpp > CMakeFiles/image_loader_test.dir/image_loader.cpp.i

kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_loader_test.dir/image_loader.cpp.s"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin/image_loader.cpp -o CMakeFiles/image_loader_test.dir/image_loader.cpp.s

# Object files for target image_loader_test
image_loader_test_OBJECTS = \
"CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o" \
"CMakeFiles/image_loader_test.dir/image_loader.cpp.o"

# External object files for target image_loader_test
image_loader_test_EXTERNAL_OBJECTS = \
"/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/utils/CMakeFiles/Vision_Utils.dir/INIReader.cpp.o" \
"/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/utils/CMakeFiles/Vision_Utils.dir/color_space.cpp.o" \
"/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/utils/CMakeFiles/Vision_Utils.dir/ini.cpp.o" \
"/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/utils/CMakeFiles/Vision_Utils.dir/snowboy_logging.cpp.o"

kernel_bin/image_loader_test: kernel_bin/CMakeFiles/image_loader_test.dir/image_loader_test.cpp.o
kernel_bin/image_loader_test: kernel_bin/CMakeFiles/image_loader_test.dir/image_loader.cpp.o
kernel_bin/image_loader_test: utils/CMakeFiles/Vision_Utils.dir/INIReader.cpp.o
kernel_bin/image_loader_test: utils/CMakeFiles/Vision_Utils.dir/color_space.cpp.o
kernel_bin/image_loader_test: utils/CMakeFiles/Vision_Utils.dir/ini.cpp.o
kernel_bin/image_loader_test: utils/CMakeFiles/Vision_Utils.dir/snowboy_logging.cpp.o
kernel_bin/image_loader_test: kernel_bin/CMakeFiles/image_loader_test.dir/build.make
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_dnn.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_ml.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_objdetect.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_shape.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_stitching.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_superres.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_videostab.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_calib3d.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_features2d.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_flann.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_highgui.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_photo.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_video.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_videoio.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_imgcodecs.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_imgproc.3.4.0.dylib
kernel_bin/image_loader_test: ../3rdparty/opencv/install/lib/libopencv_core.3.4.0.dylib
kernel_bin/image_loader_test: kernel_bin/CMakeFiles/image_loader_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable image_loader_test"
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image_loader_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
kernel_bin/CMakeFiles/image_loader_test.dir/build: kernel_bin/image_loader_test

.PHONY : kernel_bin/CMakeFiles/image_loader_test.dir/build

kernel_bin/CMakeFiles/image_loader_test.dir/clean:
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin && $(CMAKE_COMMAND) -P CMakeFiles/image_loader_test.dir/cmake_clean.cmake
.PHONY : kernel_bin/CMakeFiles/image_loader_test.dir/clean

kernel_bin/CMakeFiles/image_loader_test.dir/depend:
	cd /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/eclair/workspace/code/git/snb-vision/src /Users/eclair/workspace/code/git/snb-vision/src/kernel_bin /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin /Users/eclair/workspace/code/git/snb-vision/src/cmake-build-debug/kernel_bin/CMakeFiles/image_loader_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : kernel_bin/CMakeFiles/image_loader_test.dir/depend

