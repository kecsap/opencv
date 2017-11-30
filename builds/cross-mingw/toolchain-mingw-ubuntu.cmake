# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)
SET(CMAKE_SYSTEM_VERSION Ubuntu-CrossCompile)

# for 32 or 64 bits mingw-w64
# see http://mingw-w64.sourceforge.net/
SET(COMPILER_PREFIX "i686-w64-mingw32")
#SET(COMPILER_PREFIX "x86_64-w64-mingw32"

# Make sure that MinGW cross-compilation toolchain supports dwarf exceptions
EXEC_PROGRAM(i686-w64-mingw32-gcc ARGS -v OUTPUT_VARIABLE GCC_BUILD_FLAGS)
IF (NOT ${GCC_BUILD_FLAGS} MATCHES "(disable-sjlj-exceptions.*)")
    MESSAGE(FATAL_ERROR "MinGW cross-compilation toolchain must use dwarf exceptions.\n"
            "Please use AiBO+ Ubuntu PPA to download such a toolchain.")
ENDIF ()

# which compilers to use for C and C++
find_program(CMAKE_RC_COMPILER NAMES ${COMPILER_PREFIX}-windres)
#SET(CMAKE_RC_COMPILER ${COMPILER_PREFIX}-windres)
find_program(CMAKE_C_COMPILER NAMES ${COMPILER_PREFIX}-gcc)
#SET(CMAKE_C_COMPILER ${COMPILER_PREFIX}-gcc)
find_program(CMAKE_CXX_COMPILER NAMES ${COMPILER_PREFIX}-g++)
#SET(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}-g++)

# Adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffunction-sections -fdata-sections -fvisibility=hidden -Os")
SET(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -Wl,--gc-sections")

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffunction-sections -fdata-sections -fvisibility=hidden -fvisibility-inlines-hidden -Os")
SET(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,--gc-sections")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--gc-sections")
