include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_BREAKPAD_PASS true)

if (NOT BREAKPAD_FETCH_WAY)
    set(BREAKPAD_FETCH_WAY "https" CACHE STRING "breakpad fetch way: https, git, ...")
endif()
if (NOT BREAKPAD_FETCH_DIR)
    set(BREAKPAD_FETCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/breakpad)
endif()

if (NOT LSS_FETCH_DIR)
    set(LSS_FETCH_DIR ${BREAKPAD_FETCH_DIR}/src/third_party/lss)
endif()

list(APPEND OPTIONS CC="gcc" CXX="g++" CPP="gcc -E" CXXCPP="g++ -E")

if (BREAKPAD_PREFIX)
    list(APPEND OPTIONS --prefix=${BREAKPAD_PREFIX})
endif()

#-------------------------fetch declare------------------------

# breakpad + https
FetchContent_Declare(
    https_breakpad
    URL https://github.com/google/breakpad/archive/refs/heads/main.zip
    SOURCE_DIR ${BREAKPAD_FETCH_DIR}
)

# breakpad + git
FetchContent_Declare(
    git_breakpad
    GIT_REPOSITORY git@github.com:google/breakpad.git
    GIT_TAG v2023.06.01
    SOURCE_DIR ${BREAKPAD_FETCH_DIR}
)

# lss + https
FetchContent_Declare(
    https_lss
    URL https://github.com/cpp-pm/linux-syscall-support/archive/refs/heads/hunter-0.0.0-e1e7b0a.zip
    SOURCE_DIR ${LSS_FETCH_DIR}
)

set(BREAKPAD_FETCH_CONTENT "${BREAKPAD_FETCH_WAY}_breakpad")
set(LSS_FETCH_CONTENT "https_lss")

#-------------------------config---------------------------------
if (UNIX)
    set(CONFIG_CMD ./configure)

    set(BUILD_CMD make)
endif()

if (WIN32)
endif()
    
if (MINGW)
endif()

foreach(var ${OPTIONS})
    string(APPEND CONFIG_CMD " ${var}")
endforeach()

# -----------------------check-----------------------------

# -----------------------build-----------------------------
if (${FETCH_BREAKPAD_PASS})
    FetchContent_GetProperties(${BREAKPAD_FETCH_CONTENT})
    if(NOT ${BREAKPAD_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${BREAKPAD_FETCH_CONTENT} to ${BREAKPAD_FETCH_DIR}, please wait...")
        FetchContent_Populate(${BREAKPAD_FETCH_CONTENT})
    endif()

    FetchContent_GetProperties(${LSS_FETCH_CONTENT})
    if(NOT ${LSS_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${LSS_FETCH_CONTENT} to ${LSS_FETCH_DIR}, please wait...")
        FetchContent_Populate(${LSS_FETCH_CONTENT})
    endif()

    message(${CONFIG_CMD})
    execute_process(COMMAND ${CONFIG_CMD}
                    WORKING_DIRECTORY ${BREAKPAD_FETCH_DIR})

    message(${BUILD_CMD})
    execute_process(COMMAND ${BUILD_CMD}
                    WORKING_DIRECTORY ${BREAKPAD_FETCH_DIR})
endif()