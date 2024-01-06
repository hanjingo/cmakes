include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_TBB_PASS true)

if (NOT TBB_VERSION)
    set(TBB_VERSION "2021.11.0" CACHE STRING "oneTBB version")
endif()
if (NOT TBB_FETCH_WAY)
    set(TBB_FETCH_WAY "https" CACHE STRING "oneTBB fetch way: https, git, ...")
endif()
if (NOT TBB_ROOT)
    set(TBB_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/oneTBB/${TBB_VERSION})
endif()

#-------------------------fetch declare------------------------

# oneTBB v2021.11.0
FetchContent_Declare(
    https_oneTBB_2021.11.0
    URL https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.11.0.zip
    SOURCE_DIR ${TBB_ROOT}
)
FetchContent_Declare(
    git_oneTBB_${TBB_VERSION}
    GIT_REPOSITORY https://github.com/oneapi-src/oneTBB.git
    GIT_TAG v${TBB_VERSION}
    SOURCE_DIR ${TBB_ROOT}
)

set( TBB_FETCH_CONTENT "${TBB_FETCH_WAY}_oneTBB_${TBB_VERSION}" )

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
if (EXISTS ${TBB_ROOT})
    message(FATAL_ERROR "oneTBB root path already exist, please remove it before")
endif()

# -----------------------build-----------------------------
if (${FETCH_TBB_PASS})
    message("Downloading oneTBB_${TBB_VERSION}, please wait...")
    FetchContent_MakeAvailable(${TBB_FETCH_CONTENT})
endif()