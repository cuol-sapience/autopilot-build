cmake_minimum_required(VERSION 3.4...3.31 FATAL_ERROR) # USES_TERMINAL_BUILD introduced in 3.4 (third_party/px4.cmake)

project(sapience_autopilot)

include(ExternalProject)
include(third_party/px4.cmake)

px4_build(px4_fmu-v6c)
px4_build(cubepilot_cubeorange)