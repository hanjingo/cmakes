include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_GTEST_PASS true)

if (NOT GTEST_VERSION)
    set(GTEST_VERSION "1.14.0" CACHE STRING "google test version")
endif()
if (NOT GTEST_FETCH_WAY)
    set(GTEST_FETCH_WAY "https" CACHE STRING "google test fetch way: https, git, ...")
endif()
if (NOT GTEST_ROOT)
    set(GTEST_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/googletest/${GTEST_VERSION})
endif()

#-------------------------fetch declare------------------------

# gtest v1.14.0
FetchContent_Declare(
    https_gtest_1.14.0
    URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.zip
    SOURCE_DIR ${GTEST_ROOT}
)
FetchContent_Declare(
    git_gtest_${GTEST_VERSION}
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v${GTEST_VERSION}
    SOURCE_DIR ${GTEST_ROOT}
)

set( GTEST_FETCH_CONTENT "${GTEST_FETCH_WAY}_gtest_${GTEST_VERSION}" )

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
if (EXISTS ${GTEST_ROOT})
    message(FATAL_ERROR "google test root path already exist, please remove it before")
endif()

# -----------------------build-----------------------------
if (${FETCH_GTEST_PASS})
    message("Downloading gtest_${GTEST_VERSION}, please wait...")
    FetchContent_MakeAvailable(${GTEST_FETCH_CONTENT})
endif()