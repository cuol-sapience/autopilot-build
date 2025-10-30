
include(GNUInstallDirs)

set(ARDUPILOT_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/ardupilot)
set(ARDUPILOT_INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/dist/ardupilot)

macro(ardupilot_build target)
ExternalProject_Add(ardupilot_${target}
    SOURCE_DIR ${ARDUPILOT_SOURCE_DIR}
    DOWNLOAD_COMMAND ""
    USES_TERMINAL_CONFIGURE TRUE
    USES_TERMINAL_BUILD  TRUE
    USES_TERMINAL_INSTALL TRUE
    CONFIGURE_COMMAND make -j -C ${ARDUPILOT_SOURCE_DIR} waf ${target}-configure
    BUILD_COMMAND make -j -C ${ARDUPILOT_SOURCE_DIR} ${target}
    INSTALL_COMMAND ''
)
ExternalProject_Add_StepTargets(ardupilot_${target} configure build)

#ExternalProject_Get_property(px4_${target} BINARY_DIR)
#install(CODE "
#    file(GLOB PX4_FILES \"${BINARY_DIR}/*.px4\")
#    file(INSTALL \${PX4_FILES} 
#        DESTINATION \"${ARDUPILOT_INSTALL_DIR}/${target}\")
#")
endmacro()