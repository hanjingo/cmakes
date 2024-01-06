include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_EIGEN3_PASS true)

if (NOT EIGEN3_VERSION)
    set(EIGEN3_VERSION "3.4" CACHE STRING "eigen3 version")
endif()
if (NOT EIGEN3_FETCH_WAY)
    set(EIGEN3_FETCH_WAY "https" CACHE STRING "eigen3 fetch way: https, git, ...")
endif()
if (NOT EIGEN3_ROOT)
    set(EIGEN3_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/eigen3/${EIGEN3_VERSION})
endif()

#-------------------------fetch declare------------------------

# eigen3 3.4
FetchContent_Declare(
    https_eigen3_3.4
    URL https://gitlab.com/libeigen3/eigen3/-/archive/3.4/eigen3-3.4.zip
    SOURCE_DIR ${EIGEN3_ROOT}
)
FetchContent_Declare(
    git_eigen3_${EIGEN3_VERSION}
    GIT_REPOSITORY https://gitlab.com/libeigen3/eigen3.git
    GIT_TAG v${EIGEN3_VERSION}
    SOURCE_DIR ${EIGEN3_ROOT}
)

set( EIGEN3_FETCH_CONTENT "${EIGEN3_FETCH_WAY}_eigen3_${EIGEN3_VERSION}" )

#-------------------------config---------------------------------

if (UNIX)
endif()

if (WIN32)
endif()
    
if (APPLE)
endif()
    
if (MINGW)
endif()

# -----------------------check-----------------------------
if (EXISTS ${EIGEN3_ROOT})
    message(FATAL_ERROR "eigen3 root path already exist, please remove it before")
endif()

# -----------------------build-----------------------------
if (${FETCH_EIGEN3_PASS})
    message("Downloading eigen3_${EIGEN3_VERSION}, please wait...")
    FetchContent_MakeAvailable(${EIGEN3_FETCH_CONTENT})
endif()