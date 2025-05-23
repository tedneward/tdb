#!/bin/sh

rm -r build
mkdir build
cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=/home/ted/Projects/vcpkg/scripts/buildsystems/vcpkg.cmake
