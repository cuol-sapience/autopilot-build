set(PX4_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/px4)
set(PX4_INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/dist/px4)

macro(px4_build target)
ExternalProject_Add(px4_${target}
    SOURCE_DIR ${PX4_SOURCE_DIR}
    USES_TERMINAL_CONFIGURE TRUE
    USES_TERMINAL_BUILD  TRUE
    USES_TERMINAL_INSTALL TRUE
    CMAKE_ARGS -DCONFIG=${target} -DCMAKE_POLICY_VERSION_MINIMUM=3.5
)
ExternalProject_Add_StepTargets(px4_${target} build install)

ExternalProject_Get_property(px4_${target} BINARY_DIR)
install(CODE "
    file(GLOB PX4_FILES \"${BINARY_DIR}/*.px4\")
    file(INSTALL \${PX4_FILES} 
        DESTINATION \"${PX4_INSTALL_DIR}/${target}\")
")
endmacro()