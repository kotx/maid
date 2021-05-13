cmake_minimum_required(VERSION 3.16)
project(Maid DESCRIPTION "Maid VM agent (https://github.com/kotx/maid)" VERSION 0.1.0)

set(CMAKE_CXX_STANDARD 20)

# Prefer the latest version of deps
SET(CMAKE_FIND_PACKAGE_SORT_ORDER NATURAL)
SET(CMAKE_FIND_PACKAGE_SORT_DIRECTION DEC)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake
  CACHE STRING "Vcpkg toolchain file")

add_subdirectory(proto)

add_executable(main
    src/main.cpp
    src/remote.cpp
)

target_link_libraries(main PRIVATE maid_proto)

set(MAID_INSTALL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/bin CACHE STRING "Maid install directory")
install(FILES README.md LICENSE DESTINATION ${MAID_INSTALL_DIR})
install(TARGETS main DESTINATION ${MAID_INSTALL_DIR})
