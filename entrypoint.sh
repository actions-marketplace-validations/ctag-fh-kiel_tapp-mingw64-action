#!/usr/bin/env bash
set -e # stops execution if error on command

echo Building tbd4vcv mingw-win64
git clone --recursive https://github.com/VCVRack/Rack.git
export RACK_DIR=`pwd`/Rack
cd Rack
make dep
make
cd ..
cd tbd4vcv
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBoost_INCLUDE_DIR=/usr/local/include -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_INSTALL_PREFIX=${MINGW} -DCMAKE_FIND_ROOT_PATH=${MINGW} -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres ..
make
cpack
cd ../..
echo Building tapp mingw-win64
cd tapp
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBoost_INCLUDE_DIR=/usr/local/include -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_INSTALL_PREFIX=${MINGW} -DCMAKE_FIND_ROOT_PATH=${MINGW} -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres ..
make
cpack
echo Building tbd-sim mingw-win64
cd ../../simulator
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBoost_INCLUDE_DIR=/usr/local/include -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_INSTALL_PREFIX=${MINGW} -DCMAKE_FIND_ROOT_PATH=${MINGW} -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres ..
make
cpack