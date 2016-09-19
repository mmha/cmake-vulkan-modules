CMake Modules for Vulkan
========================

This is a set of CMake modules that enable CMake to compile SPIR-V binaries using glslangvalidator, find the Vulkan SDK (and XCB if you are on Unix). They originate from an old toy project written right after the public Vulkan release and have not seen much love since then, but maybe they will be useful for somebody.

Example Usage
-------------

```cmake
cmake_minimum_required(VERSION 3.4)
project(vulkanPlayground)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1z -fdiagnostics-color=always -g")

enable_language(GLSL)
find_package(Vulkan REQUIRED)
find_package(XCB REQUIRED)

add_executable(dummyShader vShader.vert fShader.frag)
add_executable(vulkanPlayground main.cpp VulkanWindow.cpp VulkanWindow.h)
add_dependencies(vulkanPlayground dummyShader)
target_link_libraries(vulkanPlayground ${Vulkan_LIBRARIES} ${LIBXCB_LIBRARIES} dl)
target_include_directories(vulkanPlayground PRIVATE ${Vulkan_INCLUDE_DIRS} ${LIBXCB_INCLUDE_DIRS})
target_compile_definitions(vulkanPlayground ${Vulkan_DEFINITIONS})
```
