include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_BOOST_PASS true)

if (NOT BOOST_VERSION)
    set(BOOST_VERSION "1.80.0" CACHE STRING "boost version")
endif()
if (NOT BOOST_FETCH_WAY)
    set(BOOST_FETCH_WAY "https" CACHE STRING "booset fetch way: https, git, ...")
endif()
if (NOT BOOST_ROOT)
    set(BOOST_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/boost/${BOOST_VERSION})
endif()
if (NOT CMAKE_LIBRARY_OUTPUT_DIRECTORY)
    set(BOOST_LIB_PATH ${BOOST_ROOT}/stage/lib)
else()
    set(BOOST_LIB_PATH ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endif()

option(USE_BOOST_ALL             "enable all boost component" OFF)
option(USE_BOOST_ATOMIC          "enable boost atomic" OFF)
option(USE_BOOST_CHRONO          "enable boost chrono" OFF)
option(USE_BOOST_CONTAINER       "enable boost container" OFF)
option(USE_BOOST_CONTEXT         "enable boost context" OFF)
option(USE_BOOST_CONTRACT        "enable boost contract" OFF)
option(USE_BOOST_COROUTINE       "enable boost coroutine" OFF)
option(USE_BOOST_DATE_TIME       "enable boost date_time" OFF)
option(USE_BOOST_EXCEPTION       "enable boost exception" OFF)
option(USE_BOOST_FIBER           "enable boost fiber" OFF)
option(USE_BOOST_FILESYSTEM      "enable boost filesystem" OFF)
option(USE_BOOST_GRAPH           "enable boost graph" OFF)
option(USE_BOOST_GRAPH_PARALLEL  "enable boost graph_parallel" OFF)
option(USE_BOOST_HEADERS         "enable boost headers" OFF)
option(USE_BOOST_IOSTREAM        "enable boost iostream" OFF)
option(USE_BOOST_JSON            "enable boost json" OFF)
option(USE_BOOST_LOCALE          "enable boost locale" OFF)
option(USE_BOOST_LOG             "enable boost log" OFF)
option(USE_BOOST_MATH            "enable boost math" OFF)
option(USE_BOOST_MPI             "enable boost mpi" OFF)
option(USE_BOOST_NOWIDE          "enable boost nowide" OFF)
option(USE_BOOST_PROGRAM_OPTIONS "enable boost program_options" OFF)
option(USE_BOOST_PYTHON          "enable boost python" OFF)
option(USE_BOOST_RANDOM          "enable boost random" OFF)
option(USE_BOOST_REGEX           "enable boost regex" OFF)
option(USE_BOOST_SERIALIZATION   "enable boost serialization" OFF)
option(USE_BOOST_STACKTRACE      "enable boost stacktrace" OFF)
option(USE_BOOST_SYSTEM          "enable boost system" OFF)
option(USE_BOOST_TEST            "enable boost test" OFF)
option(USE_BOOST_THREAD          "enable boost thread" OFF)
option(USE_BOOST_TIMER           "enable boost timer" OFF)
option(USE_BOOST_TYPE_ERASURE    "enable boost type_erasure" OFF)
option(USE_BOOST_WAVE            "enable boost wave" OFF)

if (USE_BOOST_ALL OR USE_BOOST_ATOMIC)
    list(APPEND OPTIONS --with-atomic)
endif()

if (USE_BOOST_ALL OR USE_BOOST_CHRONO)
    list(APPEND OPTIONS --with-chrono)
endif()

if (USE_BOOST_ALL OR USE_BOOST_CONTAINER)
    list(APPEND OPTIONS --with-container)
endif()

if (USE_BOOST_ALL OR USE_BOOST_CONTEXT)
    list(APPEND OPTIONS --with-context)
endif()

if (USE_BOOST_ALL OR USE_BOOST_CONTRACT)
    list(APPEND OPTIONS --with-contract)
endif()

if (USE_BOOST_ALL OR USE_BOOST_COROUTINE)
    list(APPEND OPTIONS --with-coroutine)
endif()

if (USE_BOOST_ALL OR USE_BOOST_DATE_TIME)
    list(APPEND OPTIONS --with-date_time)
endif()

if (USE_BOOST_ALL OR USE_BOOST_EXCEPTION)
    list(APPEND OPTIONS --with-exception)
endif()

if (USE_BOOST_ALL OR USE_BOOST_FIBER)
    list(APPEND OPTIONS --with-fiber)
endif()

if (USE_BOOST_ALL OR USE_BOOST_FILESYSTEM)
    list(APPEND OPTIONS --with-filesystem)
endif()

if (USE_BOOST_ALL OR USE_BOOST_GRAPH)
    list(APPEND OPTIONS --with-graph)
endif()

if (USE_BOOST_ALL OR USE_BOOST_GRAPH_PARALLEL)
    list(APPEND OPTIONS --with-graph_parallel)
endif()

if (USE_BOOST_ALL OR USE_BOOST_HEADERS)
    list(APPEND OPTIONS --with-headers)
endif()

if (USE_BOOST_ALL OR USE_BOOST_IOSTREAMS)
    list(APPEND OPTIONS --with-iostreams)
endif()

if (USE_BOOST_ALL OR USE_BOOST_JSON)
    list(APPEND OPTIONS --with-json)
endif()

if (USE_BOOST_ALL OR USE_BOOST_LOCALE)
    list(APPEND OPTIONS --with-locale)
endif()

if (USE_BOOST_ALL OR USE_BOOST_LOG)
    list(APPEND OPTIONS --with-log)
endif()

if (USE_BOOST_ALL OR USE_BOOST_MATH)
    list(APPEND OPTIONS --with-math)
endif()

if (USE_BOOST_ALL OR USE_BOOST_MPI)
    list(APPEND OPTIONS --with-mpi)
endif()

if (USE_BOOST_ALL OR USE_BOOST_NOWIDE)
    list(APPEND OPTIONS --with-nowide)
endif()

if (USE_BOOST_ALL OR USE_BOOST_PROGRAM_OPTIONS)
    list(APPEND OPTIONS --with-program_options)
endif()

if (USE_BOOST_ALL OR USE_BOOST_PYTHON)
    list(APPEND OPTIONS --with-python)
endif()

if (USE_BOOST_ALL OR USE_BOOST_RANDOM)
    list(APPEND OPTIONS --with-random)
endif()

if (USE_BOOST_ALL OR USE_BOOST_REGEX)
    list(APPEND OPTIONS --with-regex)
endif()

if (USE_BOOST_ALL OR USE_BOOST_SERIALIZATION)
    list(APPEND OPTIONS --with-serialization)
endif()

if (USE_BOOST_ALL OR USE_BOOST_STACKTRACE)
    list(APPEND OPTIONS --with-stacktrace)
endif()

if (USE_BOOST_ALL OR USE_BOOST_SYSTEM)
    list(APPEND OPTIONS --with-system)
endif()

if (USE_BOOST_ALL OR USE_BOOST_TEST)
    list(APPEND OPTIONS --with-test)
endif()

if (USE_BOOST_ALL OR USE_BOOST_THREAD)
    list(APPEND OPTIONS --with-thread)
endif()

if (USE_BOOST_ALL OR USE_BOOST_TIMER)
    list(APPEND OPTIONS --with-timer)
endif()

if (USE_BOOST_ALL OR USE_BOOST_TYPE_ERASURE)
    list(APPEND OPTIONS --with-type_erasure)
endif()

if (USE_BOOST_ALL OR USE_BOOST_WAVE)
    list(APPEND OPTIONS --with-wave)
endif()

list(LENGTH OPTIONS LEN)
if (${LEN} EQUAL "0")
    list(APPEND OPTIONS --without-atomic)
    list(APPEND OPTIONS --without-chrono)
    list(APPEND OPTIONS --without-container)
    list(APPEND OPTIONS --without-context)
    list(APPEND OPTIONS --without-contract)
    list(APPEND OPTIONS --without-coroutine)
    list(APPEND OPTIONS --without-date_time)
    list(APPEND OPTIONS --without-exception)
    list(APPEND OPTIONS --without-fiber)
    list(APPEND OPTIONS --without-filesystem)
    list(APPEND OPTIONS --without-graph)
    list(APPEND OPTIONS --without-graph_parallel)
    list(APPEND OPTIONS --without-headers)
    list(APPEND OPTIONS --without-iostreams)
    list(APPEND OPTIONS --without-json)
    list(APPEND OPTIONS --without-locale)
    list(APPEND OPTIONS --without-log)
    list(APPEND OPTIONS --without-math)
    list(APPEND OPTIONS --without-mpi)
    list(APPEND OPTIONS --without-nowide)
    list(APPEND OPTIONS --without-program_options)
    list(APPEND OPTIONS --without-python)
    list(APPEND OPTIONS --without-random)
    list(APPEND OPTIONS --without-regex)
    list(APPEND OPTIONS --without-serialization)
    list(APPEND OPTIONS --without-stacktrace)
    list(APPEND OPTIONS --without-system)
    list(APPEND OPTIONS --without-test)
    list(APPEND OPTIONS --without-thread)
    list(APPEND OPTIONS --without-timer)
    list(APPEND OPTIONS --without-type_erasure)
    list(APPEND OPTIONS --without-wave)
endif()

if (USE_STATIC_LIBS)
    list(APPEND OPTIONS stage --stagedir=${BOOST_LIB_PATH} --link=static)
else()
    # TODO
endif()

#-------------------------fetch declare------------------------

# boost 1.80.0
FetchContent_Declare(
    https_boost_1.80.0
    URL https://boostorg.jfrog.io/artifactory/main/release/1.80.0/source/boost_1_80_0.zip
    URL_HASH SHA256=e34756f63abe8ac34b35352743f17d061fcc825969a2dd8458264edb38781782
    SOURCE_DIR ${BOOST_ROOT}
)

# boost 1.81.0
FetchContent_Declare(
    https_boost_1.81.0
    URL https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.zip
    URL_HASH SHA256=6e689b266b27d4db57f648b1e5c905c8acd6716b46716a12f6fc73fc80af842e
    SOURCE_DIR ${BOOST_ROOT}
)

set( BOOST_FETCH_CONTENT "${BOOST_FETCH_WAY}_boost_${BOOST_VERSION}" )

#-------------------------config---------------------------------
if (UNIX)
endif()

if (WIN32)
    set(CONFIG_CMD bootstrap.bat)

    set(BUILD_CMD b2.exe)
endif()
    
if (APPLE)
endif()
    
if (MINGW)
endif()

# -----------------------check-----------------------------

# -----------------------build-----------------------------
if (${FETCH_BOOST_PASS})
    FetchContent_GetProperties(${BOOST_FETCH_CONTENT})
    if(NOT ${BOOST_FETCH_CONTENT}_POPULATED)
        # Fetch the content using previously declared details
        message("Downloading ${BOOST_FETCH_CONTENT}, please wait...")
        FetchContent_Populate(${BOOST_FETCH_CONTENT})
    endif()

    execute_process(COMMAND ${CONFIG_CMD}
                    WORKING_DIRECTORY ${BOOST_ROOT})

    execute_process(COMMAND ${BUILD_CMD} ${ARGS} ${OPTIONS}
                    WORKING_DIRECTORY ${BOOST_ROOT})
endif()

set(Boost_INCLUDE_DIRS ${BOOST_ROOT} CACHE PATH "boost include dir")
set(Boost_LIBRARY_DIRS ${BOOST_LIB_PATH}/lib CACHE PATH "boost library dir")