if(NOT CMAKE_GLSL_COMPILER)
	if(NOT ${GLSL_COMPILER} STREQUAL "")
		get_filename_component(CMAKE_GLSL_COMPILER_INIT $ENV{GLSL_COMPILER} PROGRAM PROGRAM_ARGS CMAKE_GLSL_FLAGS_ENV_INIT)
		if(CMAKE_GLSL_FLAGS_ENV_INIT)
			set(CMAKE_GLSL_COMPILER_ARG1 "${CMAKE_GLSL_FLAGS_ENV_INIT}" CACHE STRING "First argument to GLSL compiler")
		endif()
		if(NOT EXISTS ${CMAKE_GLSL_COMPILER_INIT})
			message(SEND_ERROR "Could not find compiler set in environment variable GLSL_COMPILER:\n$ENV{GLSL_COMPILER}.")
		endif()
	endif()

	set(GLSL_BIN_PATH
		$ENV{GLSLPATH}
		$ENV{GLSLROOT}
		$ENV{GLSLROOT}/../bin
		$ENV{GLSL_COMPILER}
		/usr/bin
		/usr/local/bin
	)

	# if no compiler has been specified yet, then look for one
	if(CMAKE_GLSL_COMPILER_INIT)
		set(CMAKE_GLSL_COMPILER ${CMAKE_GLSL_COMPILER_INIT} CACHE PATH "GLSL Compiler")
	else()

		find_program(CMAKE_GLSL_COMPILER
					 NAMES glslangValidator
					 PATHS ${GLSL_BIN_PATH}
		)
  endif()
endif()

mark_as_advanced(CMAKE_GLSL_COMPILER)

# configure variables set in this file for fast reload later on
configure_file(cmake/CMakeGLSLCompiler.cmake.in
	${CMAKE_PLATFORM_INFO_DIR}/CMakeGLSLCompiler.cmake @ONLY)
set(CMAKE_GLSL_COMPILER_ENV_VAR "GLSL_COMPILER")