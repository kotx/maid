cmake_minimum_required(VERSION 3.16)
set(CMAKE_CXX_STANDARD 17)

project(Maid DESCRIPTION "Maid VM agent (https://github.com/kotx/maid)" VERSION 0.1.0)

add_subdirectory(protos)

add_executable(main
    src/main.cpp
    src/remote.cpp
)

target_link_libraries(main PRIVATE maid_proto)

install(FILES README.md LICENSE DESTINATION /opt/maid)
install(TARGETS main DESTINATION /opt/maid)
