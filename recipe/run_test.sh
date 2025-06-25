#!/bin/bash -e

# Additional test on top of upstream tests

test -f $PREFIX/include/assimp/anim.h
test -f $PREFIX/lib/libassimp${SHLIB_EXT}
test -f $PREFIX/lib/pkgconfig/assimp.pc

# Test linking against the assimp library
cd test

# Compile example that links assimp
cmake -GNinja -DCMAKE_BUILD_TYPE=Release .

cmake --build . --config Release

# Run example
./assimp_main
