#!/bin/bash

echo "Building..."
echo "Build Backend..."
pushd src/Backend
chmod +x mvnw
./mvnw clean 
./mvnw package -DskipTests
popd

echo "Build Frontend..."
pushd src/Frontend
npm install
npm run build
popd

echo "Build Algorithm..."
pushd src/Algorithm
rm -rf build/
mkdir build/
cd build/
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..
ninja
cd tools/gRPCServer/
mkdir deps/
deplist=$(ldd algServer | awk  '{if (match($3,"/")){ printf("%s "),$3 } }')
cp $deplist deps/
popd

echo "Copying files..."
rm -rf release/
mkdir -p release/
cp Readme.md release/Readme.md
cp -r src/MySQL/ release/mysql/
cp -r src/Nginx/ release/nginx/
cp -r src/Redis/ release/redis/
mkdir -p release/backend/
cp src/Backend/target/staticanalyzer*.jar release/backend/staticanalyzer.jar
cp src/Backend/dockerfile release/backend/dockerfile
cp -r src/Frontend/dist release/nginx/dist
mkdir -p release/algorithm/
cp src/Algorithm/dockerfile release/algorithm/dockerfile
cp src/Algorithm/build/tools/gRPCServer/algServer release/algorithm/algServer
cp src/Algorithm/build/tools/gRPCServer/deps/* release/algorithm/dpes/
cp src/docker-compose.yaml release/docker-compose.yaml

echo "Tar..."
tar -zcvf staticanalyzer.tar.gz release/