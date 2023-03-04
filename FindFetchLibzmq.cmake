include(FetchContent)

# --------------------------------------------------------------------------------
# option
set(FETCH_LIBZMQ_PASS true)

if (NOT LIBZMQ_VERSION)
    set(LIBZMQ_VERSION "4.3.4" CACHE STRING "libzmq version")
endif()
if (NOT LIBZMQ_FETCH_WAY)
    set(LIBZMQ_FETCH_WAY "https" CACHE STRING "libzmq fetch way: https, git, ...")
endif()
if (NOT LIBZMQ_ROOT)
    set(LIBZMQ_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/libzmq/${LIBZMQ_VERSION})
endif()
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
    set(LIBZMQ_LIB_PATH ${LIBZMQ_ROOT}/build)
else()
    set(LIBZMQ_LIB_PATH ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endif()
if (NOT BUILD_SHARED)
    if (NOT BUILD_STATIC)
        set(BUILD_STATIC ON)
    endif()
endif()

# --------------------------------------------------------------------------------
# fetch declare

# libzmq 4.3.4
FetchContent_Declare(
    https_libzmq_4.3.4
    URL https://github.com/zeromq/libzmq/releases/download/v4.3.4/zeromq-4.3.4.zip
    SOURCE_DIR ${LIBZMQ_ROOT}
)
FetchContent_Declare(
    git_libzmq_4.3.4
    GIT_REPOSITORY https://github.com/zeromq/libzmq.git
    GIT_TAG v4.3.4
    SOURCE_DIR ${LIBZMQ_ROOT}
)

set( LIBZMQ_FETCH_CONTENT "${LIBZMQ_FETCH_WAY}_libzmq_${LIBZMQ_VERSION}" )

# --------------------------------------------------------------------------------
# config

if (UNIX)
endif()

if (WIN32)
    # example: cmake .. -DBUILD_STATIC=ON
    set(CMAKE_CMD cmake)

    # example: devenv.exe ZeroMQ.sln /Build "Debug|Win32" /Project libzmq-static /Project libzmq
    set(BUILD_CMD devenv.exe)
    list(APPEND BUILD_ARGS ZeroMQ.sln)
    list(APPEND BUILD_ARGS /Build)
    list(APPEND BUILD_ARGS "Debug|Win32")
    list(APPEND BUILD_ARGS /Project)
    list(APPEND BUILD_ARGS libzmq-static)
endif()
    
if (APPLE)
endif()
    
if (MINGW)
endif()

list(APPEND CMAKE_ARGS ..)
list(APPEND CMAKE_ARGS -DZMQ_BUILD_TESTS=OFF)
list(APPEND CMAKE_ARGS -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
list(APPEND CMAKE_ARGS -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
list(APPEND CMAKE_ARGS -DCMAKE_RUNTIME_OUTPUT_DIRECTORY=${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

# --------------------------------------------------------------------------------
# check

# --------------------------------------------------------------------------------
# build

if (${FETCH_LIBZMQ_PASS})
    FetchContent_GetProperties(${LIBZMQ_FETCH_CONTENT})
    if(NOT ${LIBZMQ_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${LIBZMQ_FETCH_CONTENT}, please wait...")
        FetchContent_Populate(${LIBZMQ_FETCH_CONTENT})
    endif()

    set(BUILD_DIR ${LIBZMQ_ROOT}/build)
    file(MAKE_DIRECTORY ${BUILD_DIR})

    execute_process(COMMAND ${CMAKE_CMD} ${CMAKE_ARGS}
                    WORKING_DIRECTORY ${BUILD_DIR})

    execute_process(COMMAND ${BUILD_CMD} ${BUILD_ARGS}
                    WORKING_DIRECTORY ${BUILD_DIR})

endif()

set(Libzmq_INCLUDE_DIRS ${LIBZMQ_ROOT}/include CACHE PATH "Libzmq head file path")
set(Libzmq_LIBRARY_DIRS ${LIBZMQ_LIB_PATH} CACHE PATH "Libzmq library file path")