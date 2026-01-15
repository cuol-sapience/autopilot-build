cmake_minimum_required(VERSION 3.17...3.31 FATAL_ERROR) # GIT_SUBMODULES_RECURSE introduced in 3.17 (third_party/px4.cmake)

project(sapience_autopilot)

include(ExternalProject)
include(third_party/px4.cmake)

#include(third_party/ardupilot.cmake)
#ardupilot_build(CubeOrangePlus)

#px4_build(px4_fmu-v6c v1.16.0)
#px4_build(px4_fmu-v6c v1.15.4)
#px4_build(px4_fmu-v6c v1.14.4)
#px4_build(px4_fmu-v6c 0b834dd0e7883b2211322253bac0b577e03bba5b) # Jan 15 2026, 9:51 AM GMT

px4_build(px4_fmu-v6c v1.17.0-alpha1)