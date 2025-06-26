#!/usr/bin/env bash

mkdir build && cd build

cmake ${CMAKE_ARGS} .. \
  -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
  -DASSIMP_BUILD_TESTS=ON \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DASSIMP_WARNINGS_AS_ERRORS:BOOL=OFF

make -j${CPU_COUNT}

# Run upstream tests as part of the build due to tests being tightly coupled to the main
# library code and build process. Skip floating precision tests.
bin/unit --gtest_filter=-AssimpAPITest_aiMatrix3x3.aiMatrix3FromToTest:AssimpAPITest_aiMatrix4x4.aiMatrix4FromToTest:AssimpAPITest_aiQuaternion.aiQuaternionFromNormalizedQuaternionTest

make install