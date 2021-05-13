#include <iostream>
#include <grpcpp/grpcpp.h>
#include <grpcpp/health_check_service_interface.h>
#include "include/remote.h"

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;

int main(int argc, char const *argv[])
{
    std::string server_address("0.0.0.0:80");

    grpc::EnableDefaultHealthCheckService(true);

    ServerBuilder builder;
    builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());

    RemoteService remote;
    builder.RegisterService(&remote);

    std::unique_ptr<Server> server(builder.BuildAndStart());
    std::cout << "Maid agent listening on " << server_address << std::endl;

    server->Wait();
    return 0;
}
