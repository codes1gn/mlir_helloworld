#include "Dialect/Air/IR/AirDialect.h"
#include "Dialect/Air/IR/AirOps.h"

using namespace mlir;
using namespace mlir::air;

void AirDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Dialect/Air/IR/AirOps.cpp.inc"
    >();
}

