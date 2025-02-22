include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_LIBCPP_PASS true)

if (NOT LIBCPP_VERSION_MAJOR)
    set(LIBCPP_VERSION_MAJOR "1" CACHE STRING "libcpp major version")
endif()
if (NOT LIBCPP_VERSION_MINOR)
    set(LIBCPP_VERSION_MINOR "0" CACHE STRING "libcpp minor version")
endif()
if (NOT LIBCPP_VERSION_PATCH)
    set(LIBCPP_VERSION_PATCH "0" CACHE STRING "libcpp patch version")
endif()
set(LIBCPP_VERSION "${LIBCPP_VERSION_MAJOR}.${LIBCPP_VERSION_MINOR}.${LIBCPP_VERSION_PATCH}")

if (NOT LIBCPP_FETCH_WAY)
    set(LIBCPP_FETCH_WAY "https" CACHE STRING "libcpp fetch way: https, git, ...")
endif()
if (NOT LIBCPP_FETCH_DIR)
    set(LIBCPP_FETCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libcpp/${LIBCPP_VERSION})
endif()

#-------------------------fetch declare------------------------

# libcpp + https
FetchContent_Declare(
    https_libcpp
    URL https://github.com/hanjingo/libcpp/archive/refs/heads/main.zip
    SOURCE_DIR ${LIBCPP_FETCH_DIR}
)

# libcpp + git
FetchContent_Declare(
    git_libcpp
    GIT_REPOSITORY https://github.com/hanjingo/libcpp.git
    GIT_TAG v${LIBCPP_VERSION}
    SOURCE_DIR ${LIBCPP_FETCH_DIR}
)

set(LIBCPP_FETCH_CONTENT "${LIBCPP_FETCH_WAY}_libcpp")

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
if (${FETCH_LIBCPP_PASS})
    FetchContent_GetProperties(${LIBCPP_FETCH_CONTENT})
    if(NOT ${LIBCPP_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${LIBCPP_FETCH_CONTENT}, please wait...")
        FetchContent_Populate(${LIBCPP_FETCH_CONTENT})
    endif()
endif()