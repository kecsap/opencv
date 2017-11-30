
# This check must be disabled for OpenCV
#IF (NOT UNIX)
#    MESSAGE(FATAL_ERROR "Only Unix is supported!")
#ENDIF()

# Check the mipsel compiler for Aibo
FIND_PROGRAM(OPENR_GCC3 mipsel-linux-gcc /usr/local/OPEN_R_SDK/bin)
FIND_PROGRAM(OPENR_GCC4 mipsel-aibogcc4-linux-gcc)
FIND_PROGRAM(OPENR_GCC5 mipsel-aibogcc5-linux-gcc)
IF (OPENR_GCC3)
  SET(HOST_PREFIX mipsel-linux)
  SET(OPENR_DIR /usr/local/OPEN_R_SDK)
ENDIF()
IF (OPENR_GCC4)
  SET(HOST_PREFIX mipsel-aibogcc4-linux)
  SET(OPENR_DIR /usr/lib/openr-gcc4)
ENDIF ()
IF (OPENR_GCC5)
  SET(HOST_PREFIX mipsel-aibogcc5-linux)
  SET(OPENR_DIR /usr/lib/openr-gcc5)
ENDIF ()

IF (NOT OPENR_GCC3 AND NOT OPENR_GCC4 AND NOT OPENR_GCC5)
    MESSAGE(FATAL_ERROR "Open-R installation is NOT found. Please install it")
ELSE()
    IF (OPENR_DETECTION_VERBOSE)
        MESSAGE(STATUS "Found Open-R - Directory: ${OPENR_DIR} Host prefix: ${HOST_PREFIX}")
    ENDIF()
ENDIF()

# Set the cross-compiling configuration
INCLUDE (CMakeForceCompiler)
SET(CMAKE_SYSTEM_NAME ${HOST_PREFIX})
CMAKE_FORCE_C_COMPILER("${OPENR_DIR}/bin/${HOST_PREFIX}-gcc" "")
CMAKE_FORCE_CXX_COMPILER("${OPENR_DIR}/bin/${HOST_PREFIX}-g++" "")
SET(CMAKE_CROSSCOMPILING TRUE)
# This line is needed endianness check of OpenCV
SET(CMAKE_SIZEOF_VOID_P 4)
SET(CMAKE_AR "${OPENR_DIR}/bin/${HOST_PREFIX}-ar")
SET(CMAKE_CR "${OPENR_DIR}/bin/${HOST_PREFIX}-ar")
SET(CMAKE_RANLIB "${OPENR_DIR}/bin/${HOST_PREFIX}-ranlib")
SET(CMAKE_STRIP "${OPENR_DIR}/bin/${HOST_PREFIX}-strip")
SET(OPENR_MKBIN "${OPENR_DIR}/OPEN_R/bin/mkbin")
SET(OPENR_STUBGEN2 "${OPENR_DIR}/OPEN_R/bin/stubgen2")

SET(CMAKE_FIND_ROOT_PATH ${OPENR_DIR})

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Clear the flags
SET(OPENR_FLAGS "")
SET(OPENR_CXX_FLAGS "")
SET(OPENR_FLAGS_DEBUG "")
SET(OPENR_LINKER_FLAGS "")
# Set the include flags
SET(OPENR_FLAGS "-isystem${OPENR_DIR}/OPEN_R/include -isystem${OPENR_DIR}/OPEN_R/include/MCOOP -isystem${OPENR_DIR}/OPEN_R/include/R4000")
SET(OPENR_FLAGS "${OPENR_FLAGS} -isystem${OPENR_DIR}/include")
# Add warning flags, but no strict aliasing
SET(OPENR_FLAGS "${OPENR_FLAGS} -Wall -Wextra -Wno-error -Wno-unused-local-typedefs -fno-strict-aliasing")
# Disable debug info (use an old format because of the old binutils)
SET(OPENR_FLAGS "${OPENR_FLAGS} -g0")
# Optimize for AIBO mipsel processor (RM7000).
# mips4 is better than rm7000
SET(OPENR_FLAGS "${OPENR_FLAGS} -mtune=rm7000 -march=rm7000")
# Optimization flags for maximum performance and smaller binary size.
SET(OPENR_FLAGS "${OPENR_FLAGS} -O3 -fdata-sections -ffunction-sections -fvisibility=hidden")
# Compile with C++14 and GNU extensions
SET(OPENR_CXX_FLAGS "${OPENR_CXX_FLAGS} -std=gnu++14 -fvisibility-inlines-hidden")
# Reduce the code size during compilation (-1 %)
SET(OPENR_FLAGS "${OPENR_FLAGS} -fno-tree-ch")
SET(OPENR_CXX_FLAGS "${OPENR_CXX_FLAGS} -fno-enforce-eh-specs -fno-threadsafe-statics")
# Avoid function inlining for better crash dumps
SET(OPENR_FLAGS_DEBUG "${OPENR_FLAGS_DEBUG} -fno-inline-functions")
# Fast math? It should be proved that it is useful
SET(OPENR_FLAGS "${OPENR_FLAGS} -ffast-math")
SET(OPENR_FLAGS_DEBUG "${OPENR_FLAGS_DEBUG} -DOPENR_DEBUG")
SET(OPENR_LINKER_FLAGS "${OPENR_LINKER_FLAGS} -L${OPENR_DIR}/OPEN_R/lib")
SET(OPENR_LIBS "-lObjectComm -lOPENR -lInternet -lantMCOOP -lERA201D1")

# Set the final flags
SET(CMAKE_CXX_FLAGS "${OPENR_FLAGS} ${OPENR_CXX_FLAGS}")
SET(CMAKE_C_FLAGS ${OPENR_FLAGS})
SET(CMAKE_CXX_FLAGS_DEBUG ${OPENR_FLAGS_DEBUG})
SET(CMAKE_C_FLAGS_DEBUG ${OPENR_FLAGS_DEBUG})
SET(CMAKE_CXX_FLAGS_RELEASE "")
SET(CMAKE_C_FLAGS_RELEASE "")
SET(CMAKE_CXX_FLAGS_MINSIZEREL "")
SET(CMAKE_C_FLAGS_MINSIZEREL "")
SET(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} ${OPENR_LINKER_FLAGS} ${OPENR_LIBS}")
SET(CMAKE_C_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} ${OPENR_LINKER_FLAGS} ${OPENR_LIBS}")
ADD_DEFINITIONS(-D__AIBO_BUILD__)
SET(AIBO ON)

