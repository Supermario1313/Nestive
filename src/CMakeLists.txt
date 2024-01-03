set(LIBNESTIVE_SOURCES
    formats/nes_game.cpp
)

set(NESTIVE_SOURCES
    main/main.cpp
)

set(NESTIVE_COMPILE_OPTIONS
    -Wall
    -Wextra
    -Werror
    -pedantic
    $<$<CONFIG:Debug>:-O0>
    $<$<CONFIG:Debug>:-ggdb>
    $<$<CONFIG:Release>:-O3>
)

add_library(libnestive STATIC ${LIBNESTIVE_SOURCES})

target_include_directories(libnestive
    PUBLIC ${NESTIVE_SOURCE_DIR}/src
)

target_compile_options(libnestive PRIVATE ${NESTIVE_COMPILE_OPTIONS})

add_executable(nestive ${NESTIVE_SOURCES})

target_link_libraries(nestive PRIVATE libnestive)

target_compile_options(nestive PRIVATE ${NESTIVE_COMPILE_OPTIONS})
