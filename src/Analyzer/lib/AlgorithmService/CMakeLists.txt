find_package(protobuf CONFIG REQUIRED)
find_package(gRPC CONFIG REQUIRED)
find_package(Threads)

#
# Protobuf/Grpc source files
#
set(PROTO_FILES
    algservice.proto
)

#
# Add Library target with protobuf sources
#
add_library(algproto ${PROTO_FILES})
target_link_libraries(algproto
    PUBLIC
        gRPC::grpc++_reflection
        protobuf::libprotobuf
        gRPC::grpc
        gRPC::grpc++

        checkers
        framework
        ${CLANG_LIBS}
        ${LLVM_LIBS}
        ${OTHER_LIBS}
)
target_include_directories(algproto PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

#
# Compile protobuf and grpc files in algproto target to cpp
#
get_target_property(grpc_cpp_plugin_location gRPC::grpc_cpp_plugin LOCATION)
protobuf_generate(TARGET algproto LANGUAGE cpp)
protobuf_generate(TARGET algproto LANGUAGE grpc GENERATE_EXTENSIONS .grpc.pb.h .grpc.pb.cc PLUGIN "protoc-gen-grpc=${grpc_cpp_plugin_location}")
