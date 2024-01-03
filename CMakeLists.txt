cmake_minimum_required(VERSION 3.20.6)

set(CMAKE_CXX_STANDARD 23)

project(NESTIVE CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out)

add_subdirectory(src)

enable_testing()
add_subdirectory(tests)
