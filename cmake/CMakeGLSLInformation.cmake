# This should be included before the _INIT variables are
# used to initialize the cache.  Since the rule variables
# have if blocks on them, users can still define them here.
# But, it should still be after the platform file so changes can
# be made to those values.

if(CMAKE_USER_MAKE_RULES_OVERRIDE)
  # Save the full path of the file so try_compile can use it.
  include(${CMAKE_USER_MAKE_RULES_OVERRIDE} RESULT_VARIABLE _override)
  set(CMAKE_USER_MAKE_RULES_OVERRIDE "${_override}")
endif()

if(CMAKE_USER_MAKE_RULES_OVERRIDE_GLSL)
	# Save the full path of the file so try_compile can use it.
	include(${CMAKE_USER_MAKE_RULES_OVERRIDE_GLSL} RESULT_VARIABLE _override)
	set(CMAKE_USER_MAKE_RULES_OVERRIDE_GLSL "${_override}")
endif()

if(NOT CMAKE_GLSL_COMPILE_OBJECT)
	set(CMAKE_GLSL_COMPILE_OBJECT "glslangValidator -E <SOURCE> > <OBJECT>")
endif()
if(NOT CMAKE_GLSL_LINK_EXECUTABLE)
  set(CMAKE_GLSL_LINK_EXECUTABLE "glslangValidator -V -l -t -o <TARGET>.spv <OBJECTS> ")
endif()