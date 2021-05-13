#include <remote.pb.h>
#include <remote.grpc.pb.h>

#include <grpcpp/grpcpp.h>

using google::protobuf::Empty;
using grpc::ServerContext;
using grpc::ServerReader;
using grpc::Status;

class RemoteService final : public maid::Remote::Service
{
public:
    Status Control(ServerContext *context, ServerReader<maid::ControlRequest> *reader, Empty *response) override;
};
