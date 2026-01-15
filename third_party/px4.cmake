set(PX4_INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/dist/px4)

set(PX4_REPOSITORY "https://github.com/PX4/PX4-Autopilot.git")

macro(px4_build target tag)


ExternalProject_Add(px4_${target}_${tag}
    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/px4/${tag}/${target}
    GIT_REPOSITORY ${PX4_REPOSITORY}
    GIT_TAG ${tag}
    GIT_SUBMODULES_RECURSE TRUE
    USES_TERMINAL_CONFIGURE TRUE
    USES_TERMINAL_BUILD  TRUE
    USES_TERMINAL_INSTALL TRUE
    UPDATE_COMMAND ""
    CMAKE_ARGS -DCONFIG=${target} -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    CMAKE_CACHE_ARGS -DBOARD_CONFIG:FILEPATH=${CMAKE_CURRENT_SOURCE_DIR}/px4/${target}.boardconfig
)
ExternalProject_Add_StepTargets(px4_${target}_${tag} build install)

ExternalProject_Get_property(px4_${target}_${tag} BINARY_DIR SOURCE_DIR)
install(CODE "
    file(GLOB PX4_FILES \"${BINARY_DIR}/*.px4\")
    file(INSTALL \${PX4_FILES} 
        DESTINATION \"${PX4_INSTALL_DIR}/${target}-${tag}\")
")

endmacro()