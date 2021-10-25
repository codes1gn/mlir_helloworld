#ifndef HELLOWORLD_DIALECT_AIR_IR_AIR_OPS_H
#define HELLOWORLD_DIALECT_AIR_IR_AIR_OPS_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

#define GET_OP_CLASSES
#include "Dialect/Air/IR/AirOps.h.inc"

#endif // HELLOWORLD_DIALECT_AIR_IR_AIR_OPS_H
