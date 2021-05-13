#include "include/remote.h"

Status RemoteService::Control(ServerContext *context, ServerReader<maid::ControlRequest> *reader, Empty *response)
{
    return Status::OK;
};
