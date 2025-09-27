# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appStopwatch_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appStopwatch_autogen.dir\\ParseCache.txt"
  "appStopwatch_autogen"
  )
endif()
