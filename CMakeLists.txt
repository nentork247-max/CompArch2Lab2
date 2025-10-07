cmake_minimum_required(VERSION 3.10)
project(MiniCalculator)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include_directories(include)
file(GLOB SRC_FILES src/*.cpp)

add_library(calc STATIC src/calculator.cpp)

add_executable(calculator_app src/main.cpp)

target_link_libraries(calculator_app calc)
