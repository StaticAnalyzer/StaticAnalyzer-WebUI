# 静态分析工具

## 项目地址

1. 根项目地址：https://github.com/StaticAnalyzer/StaticAnalyzer-WebUI
2. 前端：https://github.com/StaticAnalyzer/StaticAnalyzer-Frontend
3. 业务后端：https://github.com/StaticAnalyzer/StaticAnalyzer-Backend
4. 算法后端：https://github.com/StaticAnalyzer/StaticAnalyzer-Algorithm
5. 算法Docker容器：https://github.com/StaticAnalyzer/StaticAnalyzer-WebUI-DevImage

## 编译与运行

### 源码

1. 编译：

   ```shell
   chmod +x ./tools/release.sh
   ./tools/release.sh
   ```

2. 运行：

   ```shell
   cd release
   docker-compose up	# 项目运行在本机80端口
   ```

### 发布包

解压`staticanalyzer.tar.gz`，在目录中执行

```shell
# 如果之前启动过旧版本，最好重新构建
docker-compose build --no-cache
# 启动项目
docker-compose up
```

## 使用说明

1. 示例项目：用户名`testuser`密码`12345678`，包含两个测试分析结果
2. 一般使用：
   1. 注册用户并登陆
   2. 在首页上传`.tar.gz`代码压缩包（头文件搜索方式：默认位置或根目录下`include`目录）
   3. 跳转到结果列表界面，刷新界面等待状态变为`Complete`，点击左侧可以展开分析摘要，点击条目进入具体信息
3. 即时测试：无需登录，默认进行所有可用类别的测试