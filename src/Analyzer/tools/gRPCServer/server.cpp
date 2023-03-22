#include <fstream>
#include <iostream>
#include <string>
#include <sstream>
#include <cstdio>
#include <unistd.h>
#include <random>

#include <grpcpp/ext/proto_server_reflection_plugin.h>
#include <grpcpp/grpcpp.h>
#include <grpcpp/health_check_service_interface.h>

#include "algservice.grpc.pb.h"

using grpc::Server;
using grpc::ServerBuilder;
using grpc::ServerContext;
using grpc::Status;
using algservice::JustReturnRequest;
using algservice::JustReturnResponse;
using algservice::AlgService;

class AlgServiceUtils {
public:
    static std::string RandomStr(int len) {
        std::string str("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
        std::random_device rd;
        std::mt19937 generator(rd());
        std::string result;
        result.resize(len);
        for (int i = 0; i < len; i++) 
            result[i] = str[generator() % (str.size() - 1)];
        return result;
    }
};
 
class AlgServiceImpl final : public AlgService::Service {
  Status JustReturn(ServerContext* context, const JustReturnRequest* request,
                    JustReturnResponse* reply) override {
    std::string file = request->file();

    // 保存文件到本地
    std::string filename = AlgServiceUtils::RandomStr(20);
    std::ofstream out(filename + ".tar.gz", std::ios::binary);
    out.write(file.c_str(), file.length());
    out.close();

    // 解压缩文件
    std::string cmd = "mkdir " + filename + ";" + "tar -zxvf " + filename + ".tar.gz -C " + filename;
    system(cmd.c_str());

    // 执行算法
    (*reply->mutable_result())["test"] = "test";

    // 清除临时文件
    cmd = "rm -rf " + filename + ".tar.gz " + filename;
    system(cmd.c_str());

    return Status::OK;
  }
};

int main()
{
  std::string server_address("0.0.0.0:8081");
  AlgServiceImpl service;

  grpc::EnableDefaultHealthCheckService(true);
  grpc::reflection::InitProtoReflectionServerBuilderPlugin();
  ServerBuilder builder;
  // Listen on the given address without any authentication mechanism.
  builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
  // Register "service" as the instance through which we'll communicate with
  // clients. In this case it corresponds to an *synchronous* service.
  builder.RegisterService(&service);
  // Finally assemble the server.
  std::unique_ptr<Server> server(builder.BuildAndStart());
  std::cout << "Server listening on " << server_address << std::endl;

  // Wait for the server to shutdown. Note that some other thread must be
  // responsible for shutting down the server for this call to ever return.
  server->Wait();
}