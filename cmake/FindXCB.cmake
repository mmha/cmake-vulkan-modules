# Try to find libxcb
# This will define:
#   XCB_INCLUDE_DIRS
#   XCB_LIBRARIES

include(FindPackageHandleStandardArgs)

if(NOT WIN32)
    if(LIBXCB_LIBRARIES AND LIBXCB_INCLUDE_DIR)
        set(XCB_FIND_QUIETLY TRUE)
    endif()

    find_path(LIBXCB_INCLUDE_DIR xcb/xcb.h)
    find_library(LIBXCB_LIBRARY NAMES xcb libxcb)

    set(LIBXCB_LIBRARIES ${LIBXCB_LIBRARY})
    set(LIBXCB_INCLUDE_DIRS ${LIBXCB_INCLUDE_DIR})

    find_package_handle_standard_args(LIBXCB DEFAULT_MSG
        LIBXCB_LIBRARY LIBXCB_INCLUDE_DIR)

    mark_as_advanced(LIBXCB_LIBRARY LIBXCB_INCLUDE_DIR)
endif()
