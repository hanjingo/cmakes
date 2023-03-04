include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_SPDLOG_PASS true)

if (NOT SPDLOG_VERSION)
    set(SPDLOG_VERSION "1.11.0" CACHE STRING "spd log version")
endif()
if (NOT SPDLOG_FETCH_WAY)
    set(SPDLOG_FETCH_WAY "https" CACHE STRING "spd log fetch way: https, git, ...")
endif()
if (NOT SPDLOG_ROOT)
    set(SPDLOG_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/spdlog/${SPDLOG_VERSION})
endif()

#-------------------------fetch declare------------------------

# spdlog 1.11.0
FetchContent_Declare(
    https_spdlog_1.11.0
    URL https://github.com/gabime/spdlog/archive/refs/tags/v1.11.0.zip
    SOURCE_DIR ${SPDLOG_ROOT}
)
FetchContent_Declare(
    git_spdlog_1.11.0
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.11.0
    SOURCE_DIR ${SPDLOG_ROOT}
)

set( SPDLOG_FETCH_CONTENT "${SPDLOG_FETCH_WAY}_spdlog_${SPDLOG_VERSION}" )

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
if (EXISTS ${SPDLOG_ROOT})
    message(FATAL_ERROR "Spdlog root path already exist, please remove it before")
endif()

# -----------------------build-----------------------------
if (${FETCH_SPDLOG_PASS})
    message("Downloading spdlog_${SPDLOG_VERSION}, please wait...")
    FetchContent_MakeAvailable(${SPDLOG_FETCH_CONTENT})
endif()