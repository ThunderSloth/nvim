cmake_minimum_required(VERSION 3.10)

project([:LUA_EVAL:]vim.fn.expand("%:p:h"):match("[^/]*$")[:END_EVAL:])

set(CMAKE_CXX_STANDARD 11)

# Add all .cpp files in the current directory to a variable
file(GLOB SOURCES *.cpp)

# Create an executable target and add all the .cpp files to it
add_executable([:LUA_EVAL:]vim.fn.expand("%:p:h"):match("[^/]*$")[:END_EVAL:] ${SOURCES})
