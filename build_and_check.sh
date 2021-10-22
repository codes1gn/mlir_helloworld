mkdir mlir_install
mkdir mlir_build
cd mlir_build
# configure mlir
cmake -G Ninja \
    ../external/llvm-project/llvm \
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_TARGETS_TO_BUILD="X86" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_C_COMPILER=clang-11 \
    -DCMAKE_CXX_COMPILER=clang++-11 \
    -DCMAKE_INSTALL_PREFIX=../mlir_install \
    -DLLVM_INSTALL_UTILS=ON \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_USE_LINKER=lld

# build mlir and install
cmake --build . --target install
cmake --build . --target check-mlir

# switch back to the top level dir
cd -

mkdir build
cd build
# configure helloworld
cmake -G Ninja .. \
    -DMLIR_DIR=./mlir_install/lib/cmake/mlir \
    -DLLVM_EXTERNAL_LIT=./mlir_build/bin/llvm-lit \
    -DCMAKE_C_COMPILER=clang-11 \
    -DCMAKE_CXX_COMPILER=clang++-11 \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_USE_LINKER=lld

# build helloworld
cmake --build . --target helloworld

cd -
