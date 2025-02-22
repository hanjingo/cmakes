include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_EIGEN3_PASS true)

if (NOT EIGEN3_VERSION_MAJOR)
    set(EIGEN3_VERSION_MAJOR "3" CACHE STRING "EIGEN3 major version")
endif()
if (NOT EIGEN3_VERSION_MINOR)
    set(EIGEN3_VERSION_MINOR "4" CACHE STRING "EIGEN3 minor version")
endif()
if (NOT EIGEN3_VERSION_PATCH)
    set(EIGEN3_VERSION_PATCH "0" CACHE STRING "EIGEN3 patch version")
endif()
set(EIGEN3_VERSION "${EIGEN3_VERSION_MAJOR}.${EIGEN3_VERSION_MINOR}")
if (NOT EIGEN3_FETCH_WAY)
    set(EIGEN3_FETCH_WAY "https" CACHE STRING "eigen3 fetch way: https, git, ...")
endif()
if (NOT EIGEN3_FETCH_DIR)
    set(EIGEN3_FETCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/eigen3/${EIGEN3_VERSION})
endif()

#-------------------------fetch declare------------------------

# eigen3 3.4
FetchContent_Declare(
    https_eigen3
    URL https://gitlab.com/libeigen3/eigen3/-/archive/${EIGEN3_VERSION}/eigen3-${EIGEN3_VERSION}.zip
    SOURCE_DIR ${EIGEN3_FETCH_DIR}
)
FetchContent_Declare(
    git_eigen3
    GIT_REPOSITORY https://gitlab.com/libeigen3/eigen3.git
    GIT_TAG v${EIGEN3_VERSION}
    SOURCE_DIR ${EIGEN3_FETCH_DIR}
)

set( EIGEN3_FETCH_CONTENT "${EIGEN3_FETCH_WAY}_eigen3" )

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

# -----------------------build-----------------------------
if (${FETCH_EIGEN3_PASS})
    message("Downloading eigen3_${EIGEN3_VERSION}, please wait...")
    FetchContent_MakeAvailable(${EIGEN3_FETCH_CONTENT})
endif()