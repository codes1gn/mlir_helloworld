#include "Dialect/Air/IR/AirDialect.h"
#include "Dialect/Air/IR/AirOps.h"

void mlir::air::AirDialect::initialize() {
  mlir::addOperations<
#define GET_OP_LIST
#include "Dialect/Air/IR/AirOps.cpp.inc"
    >();
}

