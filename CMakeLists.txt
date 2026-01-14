cmake_minimum_required(VERSION 3.4...3.31 FATAL_ERROR) # USES_TERMINAL_BUILD introduced in 3.4 (third_party/px4.cmake)

project(sapience_autopilot)

include(ExternalProject)
include(third_party/px4.cmake)

#include(third_party/ardupilot.cmake)
#ardupilot_build(CubeOrangePlus)

px4_build(px4_fmu-v6c)