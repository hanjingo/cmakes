include(FetchContent)

# --------------------------------------------------------------------------------
# option
set(FETCH_ZMQPP_PASS true)

if (NOT ZMQPP_VERSION)
    set(ZMQPP_VERSION "4.2.0" CACHE STRING "zmqpp version")
endif()
if (NOT ZMQPP_FETCH_WAY)
    set(ZMQPP_FETCH_WAY "https" CACHE STRING "zmqpp fetch way: https, git, ...")
endif()
if (NOT ZMQPP_ROOT)
    set(ZMQPP_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/zmqpp/${ZMQPP_VERSION})
endif()
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${ZMQPP_ROOT}/build)
endif()

# --------------------------------------------------------------------------------
# fetch declare

# zmqpp 4.2.0
FetchContent_Declare(
    https_zmqpp_4.2.0
    URL https://github.com/zeromq/zmqpp/archive/refs/tags/4.2.0.zip
    SOURCE_DIR ${ZMQPP_ROOT}
)
FetchContent_Declare(
    git_zmqpp_4.2.0
    GIT_REPOSITORY https://github.com/zeromq/zmqpp.git
    GIT_TAG v4.2.0
    SOURCE_DIR ${ZMQPP_ROOT}
)

set( ZMQPP_FETCH_CONTENT "${ZMQPP_FETCH_WAY}_zmqpp_${ZMQPP_VERSION}" )

# --------------------------------------------------------------------------------
# config

if (UNIX)
endif()

if (WIN32)
    # example: cmake .. -DBUILD_STATIC=ON
    set(CMAKE_CMD cmake)

    # example: devenv.exe Project.sln /Build "Debug|Win32" /Project zmqpp-static
    set(BUILD_CMD devenv.exe)
    list(APPEND BUILD_ARGS Project.sln)
    list(APPEND BUILD_ARGS /Build)
    list(APPEND BUILD_ARGS "Debug|Win32")
    list(APPEND BUILD_ARGS /Project)
    list(APPEND BUILD_ARGS zmqpp-static)
endif()
    
if (APPLE)
endif()
    
if (MINGW)
endif()

list(APPEND CMAKE_ARGS ..)
list(APPEND CMAKE_ARGS -DZMQPP_LIBZMQ_NAME_STATIC="${Libzmq_NAME_STATIC}")
list(APPEND CMAKE_ARGS -DZMQPP_LIBZMQ_NAME_SHARED="${Libzmq_NAME_SHARED}")
list(APPEND CMAKE_ARGS -DZEROMQ_LIB_DIR=${Libzmq_LIBRARY_DIRS})
list(APPEND CMAKE_ARGS -DZEROMQ_INCLUDE_DIR=${Libzmq_INCLUDE_DIRS})
list(APPEND CMAKE_ARGS -DZMQ_BUILD_TESTS=OFF)

# --------------------------------------------------------------------------------
# check

# --------------------------------------------------------------------------------
# build
if (${FETCH_ZMQPP_PASS})
    FetchContent_GetProperties(${ZMQPP_FETCH_CONTENT})
    if(NOT ${ZMQPP_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${ZMQPP_FETCH_CONTENT}, please wait...")
        FetchContent_Populate(${ZMQPP_FETCH_CONTENT})
    endif()

    set(BUILD_DIR ${ZMQPP_ROOT}/build)
    file(MAKE_DIRECTORY ${BUILD_DIR})

    execute_process(COMMAND ${CMAKE_CMD} ${CMAKE_ARGS}
                    WORKING_DIRECTORY ${BUILD_DIR})

    execute_process(COMMAND ${BUILD_CMD} ${BUILD_ARGS}
                    WORKING_DIRECTORY ${BUILD_DIR})

endif()

set(Zmqpp_INCLUDE_DIRS ${ZMQPP_ROOT}/include 
    CACHE PATH "Zmqpp head file path")
set(Zmqpp_LIBRARY_DIRS ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/${CMAKE_BUILD_TYPE}  
    CACHE PATH "Zmqpp library file path")