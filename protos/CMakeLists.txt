include(FindProtobuf)

find_package(Protobuf 3.12 REQUIRED)
find_package(gRPC REQUIRED)

set(PROTO_FILES
    remote.proto
)

add_library(maid_proto ${PROTO_FILES})
target_link_libraries(maid_proto
    PUBLIC
        protobuf::libprotobuf
        gRPC::grpc
        gRPC::grpc++
        gRPC::grpc++_reflection
)
target_include_directories(maid_proto PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

get_target_property(grpc_cpp_plugin_location gRPC::grpc_cpp_plugin LOCATION)
message(STATUS "Found gRPC C++ plugin at ${grpc_cpp_plugin_location}")

protobuf_generate(TARGET maid_proto LANGUAGE cpp)

# This feature requires Protobuf 3.12? or above: (460376190bc9c7da37a7431def0f2337b4e30502)
protobuf_generate(TARGET maid_proto LANGUAGE grpc GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cpp PLUGIN "protoc-gen-grpc=${grpc_cpp_plugin_location}")
