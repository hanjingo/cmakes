include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_GTEST_PASS true)

if (NOT GTEST_VERSION_MAJOR)
    set(GTEST_VERSION_MAJOR "1" CACHE STRING "GTEST major version")
endif()
if (NOT GTEST_VERSION_MINOR)
    set(GTEST_VERSION_MINOR "14" CACHE STRING "GTEST minor version")
endif()
if (NOT GTEST_VERSION_PATCH)
    set(GTEST_VERSION_PATCH "0" CACHE STRING "GTEST patch version")
endif()
set(GTEST_VERSION "${GTEST_VERSION_MAJOR}.${GTEST_VERSION_MINOR}.${GTEST_VERSION_PATCH}")

if (NOT GTEST_FETCH_WAY)
    set(GTEST_FETCH_WAY "https" CACHE STRING "google test fetch way: https, git, ...")
endif()
if (NOT GTEST_FETCH_DIR)
    set(GTEST_FETCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/googletest/${GTEST_VERSION})
endif()

#-------------------------fetch declare------------------------

# gtest+https
FetchContent_Declare(
    https_gtest
    URL https://github.com/google/googletest/archive/refs/tags/v${GTEST_VERSION}.zip
    SOURCE_DIR ${GTEST_FETCH_DIR}
)
FetchContent_Declare(
    git_gtest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v${GTEST_VERSION}
    SOURCE_DIR ${GTEST_FETCH_DIR}
)

set( GTEST_FETCH_CONTENT "${GTEST_FETCH_WAY}_gtest" )

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
if (EXISTS ${GTEST_FETCH_DIR})
    message(FATAL_ERROR "google test root path already exist, please remove it before")
endif()

# -----------------------build-----------------------------
if (${FETCH_GTEST_PASS})
    message("Downloading ${GTEST_FETCH_CONTENT}, please wait...")
    FetchContent_MakeAvailable(${GTEST_FETCH_CONTENT})
endif()