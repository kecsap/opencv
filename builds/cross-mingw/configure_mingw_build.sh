
# Configure CMake
cmake -Bbuild -H../.. -DCMAKE_TOOLCHAIN_FILE=builds/cross-mingw/toolchain-mingw-ubuntu.cmake \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_opencv_python=OFF \
    -DWITH_EIGEN=OFF \
    -DCMAKE_INSTALL_PREFIX=./libs \
    -DOPENCV_EXTRA_MODULES_PATH="../../contrib/modules"

