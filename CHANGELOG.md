# v3.0.0 (2023-06-13)
## General
### Bug Fixes
* 修复压缩包大于1M时无法上传的问题(dc4f7c7)
### Features
## Backend
### Bug Fixes
* 解决了无法从Queueing变化为Completed的问题(2f33c62)
* 真的修复了Queueing时无法读取的问题(569bad5)
* 修复了遇到不匹配文件时出现空指针的问题(e237421)
* 修复了缓存无法读到Queueing状态的问题(5fa6fbd)
* 修复了无法完全读取超长源文件的问题(c96058d)
### Features
* 向分析问题汇报中添加了算法类型字段(491d424)
## Frontend
### Bug Fixes
### Features
* 添加分析类型筛选，添加抽屉式报错列表(38d7a32)
* 上传页支持配置std, includeDir, defineMacro参数(91a2877)
## Algorithm
### Bug Fixes
* 修复MemoryLeakAnalysis对*x=new等语句sigfault问题(ab67b81)
* 修复config为空时报错问题(6fc21ea)
* 修复server运行时标准库头文件报错(b6fb3db)
* 修复server返回结果中有空文件名的问题(cbcda54)
* 修复tryZExtValue相关assert报错(054524a)
* fix a bug about parenthesis around a single variable(2449b9a)
* 修复子表达式导致的false positive(5cdf34c)
* 修复DeadCodeElimination中静态变量误报问题(05eb64e)
* 修复DeadCodeEliminationAnalysis全局变量误报、空报告问题(c01a02b)
* 修复dead var分析重复报告问题(15b458e)
* fix improper processing of unary operator(7296369)
* 减少冗余的四则运算强度消解提示(a48c550)
* 修复UseBeforeDef分析对全局变量的误报(709bfc7)
* 修复cliAnalyzer -O选项不生效(27857ac)
* fix crash of constant propagation on cpython(a574d0c)
* 修复getDirectCallee相关空指针错误(70b3f1a)
* 修复getExtValue()assert报错(e871875)
### Features
* server新增分析请求配置std, includeDirs, defMacros(2e98eba)
* cliAnalyzer添加自定义args参数(f17f93e)
* 添加控制台staticanalyzer工具(d2b7c9e)
* add command line interface for constant propagation(24e4076)
* add support and filter for system standard lib(55ca1e3)
# v2.4.0 (2023-06-06)
## General
### Bug Fixes
### Features
## Backend
### Bug Fixes
* 修复redis缓存无法反序列化、api字段问题(f382e31)
### Features
* 加入问题报告(accb42b)
* 引入了新的targz功能(51d765b)
## Frontend
### Bug Fixes
* 修复全局多余的纵向滚动条(8f6f03d)
### Features
* 添加problem list展示组件(4b25610)
## Algorithm
### Bug Fixes
* fix an NDP in libanalyzer(1a4b553)
* 修复数组越界分析忽略init_expr以及代码风格(2184ef5)
* disable implicit cast of AnalysisFactory(535793a)
* fix a bug in libanalyzer(38333e6)
### Features
* add support for compile arguments(009444c)
* 添加除零分析与数组越界分析(b86277d)
* add new features in constant propagation(7fd0276)
* 添加NullPointerDereferenceAnalysis(88c8844)
* add constant propagation analysis(dabe0c6)
* 添加内存泄漏分析(9ad7cbc)
* 添加基于活跃变量分析的死代码消除(0e7ec62)
* add command line interface for live variable analysis(cc3756e)
* add live variable analysis in the framework(3d526d9)
# v2.3.0 (2023-05-23)
## General
### Bug Fixes
* 修复release.sh新算法框架适配(0218611)
### Features
## Backend
## Frontend
### Bug Fixes
* 适配新算法框架config协议(66fea97)
### Features
## Algorithm
### Bug Fixes
* 修复2^x*x表达式识别错误问题(5e77e15)
* 将ReachingDefinationAnalysis修改为UseBeforeDefAnalysismit(78f7f14)
* update submodule to resolve compile error(8a858fa)
### Features
* 添加四则运算强度削减分析(d1224e6)
* 添加基于新框架数据流分析的未初始化变量分析mit(d763b73)
# v2.2.0 (2023-05-10)
## General
### Bug Fixes
### Features
## Backend
### Bug Fixes
* 修复单文件测试没有错误时的报错问题(9b5761d)
### Features
* 添加了单文件分析功能，并修复了多个算法结果列表无法整合的问题(c0402cb)
* 添加即时测试接口(65d8aad)
## Frontend
### Bug Fixes
### Features
* 添加即时测试功能(78c4f89)
## Algorithm
# v2.1.0 (2023-04-27)
## General
### Bug Fixes
### Features
* docker引入redis(dfdfe9d)
* 添加自动化生成Changelog脚本(688ec64)
## Backend
### Bug Fixes
* 修复目录处理相关空指针问题(70fb867)
* 修复了算法错误时继续分析的问题(70f9807)
* 修复了timestamp和analyseBrief为空的问题(963a162)
* 修复时间戳不存入数据库问题(e183f1a)
* 修复ProjectVO反序列化失败、gRPC服务器连接失败问题(f62bc52)
* 修复了缓存中返回空映射仍然命中的问题(6c677f7)
* 修复了DirectoryEntry的名称问题(6b596a3)
* 修复了redis无法序列化protobuf类的问题、目录结构不准确的问题(363893a)
* 修复了用户模块的问题(2274d82)
* 修复数据库用户名密码匹配错误(1f2b73b)
* 修复protobuf协议缺少一层list的问题(f451f23)
### Features
* 添加新的项目缓存，提升效率(86c582a)
* 添加用户相关的服务异常以及异常处理(a0b8525)
* 优化了分析文件的生成(2a260f1)
* 完善了项目相关的POJO(c227db0)
* 完善了project服务(73046f2)
* 完善VO之间的相互转换(9c90729)
* 完善了Directory的转换(69fd062)
* 统一管理user配置(dddf737)
* 重建引入protobuf类后的类结构(9430469)
* 新增协议类并分层(c244714)
* 引入redis功能(ac38dfc)
* 添加targz解压方法与文件类目录类等(e1ce110)
## Frontend
### Bug Fixes
* 修复目录字典遍历方式错误(6490707)
* 调整api适配(7c8a8ae)
* 添加mockjs依赖(bbcb75c)
* 用户分析结果页面适配4-12日新协议api(06fa9a5)
### Features
* 添加目录树组件，完善结果查询详情页面(57d29c7)
* 添加Monaco Editor代码展示组件(1c7c15b)
## Algorithm
### Bug Fixes
* 修复ResultUnit赋值重载缺少*this问题(207fbd8)
* 修复算法结果中code错误、文件名包含多余前后缀等问题(28667c2)
* grpc 修复返回的文件名包含临时目录问题(1008199)
* fix a typo and refactor api(c70b861)
* delete unused fields(630a50d)
* 缩小镜像大小(c844ad1)
### Features
* 将grpc通信内容从json改为明确的结构体(bf8e098)
* polish analysis result(d0551d2)
* 添加未初始化变量简单分析(82cd642)
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