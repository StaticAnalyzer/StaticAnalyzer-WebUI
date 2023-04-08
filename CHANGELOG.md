# v2.0.0 (2023-04-08)

第一个可运行版🎉🎉

## General
### Bug Fixes
* 修复dockerfile若干配置错误(8cdb3d2)
* 修复nginx路由后端错误(bb8ec71)
* 修复release脚本docker-compose复制错误(296b4da)
* 修复docker-compose配置文件命名错误(c2b65be)
* project表添加config字段(e605f4f)
* fix a typo in log(061f52d)
### Features
* 更新submodule为可运行版(568cdff)
* 添加数据库初始化文件(c24dda8)
* 业务后端 算法后端 引入gRPC框架(57c2367)
* 添加Github Action 自动化release发布(ba353b7)
## Backend
### Bug Fixes
* 修复prod配置中grpc url错误(6a36f2f)
* 移除多余log，修复prod中grpc服务器地址错误(81b96f4)
* 修复表单内容获取失败的问题(6e1818b)
* 修复了jwt验证失败后返回空值的漏洞与无法更新用户密码的漏洞(8f45cd7)
* 移除UserMapper中的selectWithProjectById(d2cf699)
* 修复长度检查不生效的问题(fa048ba)
* 修复了返回信息为空的异常和拦截器空指针异常(b075c8a)
* 修复Project实体缺少config字段的问题(32bb157)
### Features
* 完善控制器和JWT拦截器(805ba43)
* mvc基本框架(未测试)(81bc17b)
* 添加User,Project数据库支持(e7fe708)
* 业务后端 算法后端 引入gRPC框架(5e500bd)
## Frontend
### Bug Fixes
* 修复api接口与返回值(23063d0)
* 将api url修改为适配后端文档(b75734d)
* 修复登陆相关api url和jwt位置(9b7e02f)
### Features
* 添加查看结果页面(15c3f7a)
* 添加项目相关包依赖, 用户相关与上传文件页面以及路由关系(df0134b)
## Algorithm
### Bug Fixes
* 修复config格式错误后server退出的问题(52893e8)
* 修复参数不符合预期时崩溃的问题(1487846)
* fix a typo in log(49eca8f)
### Features
* 添加算法服务网络接口(60c5c48)
* refactor analysis frame work and add echo analysis(8d0941b)
* 业务后端 算法后端 引入gRPC框架(da14ce1)
# 1.0.0 (2023-02-28)


### Docs

* 初始化项目文档 (e2456a0)