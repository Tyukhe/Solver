# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles/appSolver_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/appSolver_autogen.dir/ParseCache.txt"
  "appSolver_autogen"
  )
endif()
