include(FetchContent)

#-----------------------------option--------------------------
set(FETCH_XTP_PASS true)

if (NOT XTP_VERSION)
    set(XTP_VERSION "2.2.33.5" CACHE STRING "xtp version")
endif()
if (NOT XTP_FETCH_WAY)
    set(XTP_FETCH_WAY "https" CACHE STRING "xtp fetch way: https, ...")
endif()
if (NOT XTP_ROOT)
    set(XTP_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/xtp/XTP_VERSION)
endif()

#-------------------------fetch declare------------------------

# xtp 2.2.33.5
FetchContent_Declare(
    https_xtp_2.2.33.5
    URL https://xtp.zts.com.cn/dl/sdk/XTP_API_20220402_2_2_33_5.zip
    SOURCE_DIR ${XTP_ROOT}
)

# xtp 2.2.32.2 
FetchContent_Declare(
    https_xtp_2.2.32.2 
    URL https://xtp.zts.com.cn/dl/sdk/XTP_API_20211008_22322.zip
    SOURCE_DIR ${XTP_ROOT}
)

set( XTP_FETCH_CONTENT "${XTP_FETCH_WAY}_xtp_${XTP_VERSION}" )

#-------------------------config---------------------------------

if (UNIX)
    set(DLL_PATH ${XTP_ROOT}/bin/linux_glibc_2.12)
    #set(DLL_PATH ${XTP_ROOT}/bin/linux_glibc_2.17)
endif()

if (WIN32)
    if (CMAKE_CL_64)
        set(DLL_PATH ${XTP_ROOT}/bin/win64/dll)
    else()
        set(DLL_PATH ${XTP_ROOT}/bin/win32/dll)
    endif()
endif()
    
if (APPLE)
    set(DLL_PATH ${XTP_ROOT}/bin/macosx)
endif()
    
if (MINGW)
endif()

# -----------------------check-----------------------------
if (EXISTS ${XTP_ROOT})
    set(FETCH_XTP_PASS false)
endif()

# -----------------------build-----------------------------
if (${FETCH_XTP_PASS})
    message("Downloading ${XTP_FETCH_CONTENT}, please wait...")
    FetchContent_MakeAvailable(${XTP_FETCH_CONTENT})
endif()

set(Xtp_INCLUDE_DIRS ${XTP_ROOT}/bin/include CACHE PATH "XTP head file include dir")
set(Xtp_LIBRARY_DIRS ${DLL_PATH} CACHE PATH "XTP library file dir")