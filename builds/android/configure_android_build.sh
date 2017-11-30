ANDROID_NDK=/home/kecsap/android/android-ndk ANDROID_NATIVE_API_LEVEL=android-19 cmake -Bbuild -H../.. \
    -DCMAKE_TOOLCHAIN_FILE=builds/android/toolchain-android.cmake \
    -DCMAKE_INSTALL_PREFIX=./libs \
    -DCMAKE_INSTALL_LIBDIR="lib/" \
    -DCMAKE_BUILD_TYPE=Release  \
    -DENABLE_PRECOMPILED_HEADERS=OFF \
    -DENABLE_SSE=OFF    \
    -DENABLE_SSE2=OFF   \
    -DENABLE_SSE3=OFF   \
    -DENABLE_SSSE3=OFF  \
    -DUSE_FAST_MATH=ON  \
    -DUSE_O3=OFF    \
    -DUSE_OMIT_FRAME_POINTER=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DINSTALL_C_EXAMPLES=OFF \
    -DINSTALL_OCTAVE_EXAMPLES=OFF   \
    -DINSTALL_PYTHON_EXAMPLES=OFF    \
    -DBUILD_NEW_PYTHON_SUPPORT=OFF   \
    -DBUILD_OCTAVE_SUPPORT=OFF  \
    -DUSE_IPP=OFF    \
    -DWITH_CAROTENE=OFF \
    -DWITH_FFMPEG=OFF    \
    -DWITH_GSTREAMER=OFF    \
    -DWITH_GTK=OFF   \
    -DWITH_JASPER=OFF    \
    -DWITH_JPEG=ON  \
    -DWITH_PNG=ON   \
    -DWITH_TIFF=ON  \
    -DWITH_PVAPI=OFF \
    -DWITH_TBB=OFF  \
    -DWITH_UNICAP=OFF   \
    -DWITH_1394=OFF  \
    -DWITH_V4L=OFF   \
    -DWITH_XINE=OFF \
    -DWITH_PVAPI=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_CUDA=OFF \
    -DWITH_EIGEN=OFF \
    -DBUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_DOCS=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_VERBOSE=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DWITH_OPENCL=OFF \
    -DBUILD_DOCS=OFF \
    -DBUILD_opencv_gpu=ON \
    -DBUILD_opencv_highgui=ON \
    -DBUILD_opencv_superres=ON \
    -DBUILD_opencv_bgsegm=ON \
    -DBUILD_ZLIB=ON \
    -DBUILD_ANDROID_EXAMPLES=OFF \
    -DHAVE_androidcamera=OFF \
    -DBUILD_opencv_python=OFF \
    -DOPENCV_EXTRA_MODULES_PATH="../../contrib/modules"
