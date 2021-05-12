find_package(Protobuf REQUIRED)
find_package(gRPC REQUIRED)

set(PROTOS
    remote.proto
)

add_library(maid_proto ${PROTOS})
target_link_libraries(maid_proto
    PUBLIC
        protobuf::libprotobuf
        gRPC::grpc
        gRPC::grpc++
)
target_include_directories(maid_proto PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

get_target_property(grpc_cpp_plugin_location gRPC::grpc_cpp_plugin LOCATION)
protobuf_generate(TARGET maid_proto LANGUAGE cpp)
protobuf_generate(TARGET maid_proto LANGUAGE grpc GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cc PLUGIN "protoc-gen-grpc=${grpc_cpp_plugin_location}")
