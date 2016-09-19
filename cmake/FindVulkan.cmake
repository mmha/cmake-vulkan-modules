# Try to find Vulkan
# This will define:
# 	Vulkan_INCLUDE_DIRS
#	Vulkan_LIBRARIES
#	Vulkan_DEFINITIONS
#	GLSL_VALIDATOR		- Executable which validates the GLSL Code

if(WIN32)
	include(subdirlist)
	subdirlist(win32VulkanHints "C:/VulkanSDK") # FIXME Sort that list
endif()

find_path(Vulkan_INCLUDE_DIR "vulkan/vulkan.h" HINTS ${win32VulkanHints} PATH_SUFFIXES "Include")
find_library(Vulkan_LIBRARY vulkan-1 vulkan HINTS ${win32VulkanHints})

set(Vulkan_DEFINITIONS)
if(WIN32)
	list(APPEND Vulkan_DEFINITIONS PRIVATE -DVK_USE_PLATFORM_WIN32_KHR)
	list(APPEND Vulkan_DEFINITIONS PRIVATE -DWIN32_LEAN_AND_MEAN)
endif()

if(UNIX)
	list(APPEND Vulkan_DEFINITIONS PRIVATE -DVK_USE_PLATFORM_XCB_KHR)
endif()
set(Vulkan_LIBRARIES ${Vulkan_LIBRARY})
set(Vulkan_INCLUDE_DIRS ${Vulkan_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Vulkan  DEFAULT_MSG
                                  Vulkan_LIBRARY Vulkan_INCLUDE_DIR)

mark_as_advanced(Vulkan_INCLUDE_DIR Vulkan_LIBRARY)