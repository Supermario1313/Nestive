find_package(Boost COMPONENTS system filesystem unit_test_framework REQUIRED)

set(NESTIVE_TEST_SOURCES
    test_main.cpp
)

add_executable(nestive_test ${NESTIVE_TEST_SOURCES})

target_include_directories(nestive_test PRIVATE
    ${NESTIVE_SOURCE_DIR}/src
    ${Boost_INCLUDE_DIRS}
)

target_compile_definitions(nestive_test PRIVATE
    -DBOOST_TEST_DYN_LINK
)

target_compile_options(nestive_test PRIVATE
    -Wall
    -Wextra
    -Werror
    -pedantic
    $<$<CONFIG:Debug>:-O0>
    $<$<CONFIG:Debug>:-ggdb>
    $<$<CONFIG:Release>:-O3>
)

target_link_libraries(nestive_test PRIVATE
    libnestive
    ${Boost_FILESYSTEM_LIBRARY}
    ${Boost_SYSTEM_LIBRARY}
    ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY}
)

add_test(NAME nestive_testset COMMAND nestive_test)
