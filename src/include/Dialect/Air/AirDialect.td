#ifndef HELLOWORLD_DIALECT_AIR_IR_AIR_DIALECT
#define HELLOWORLD_DIALECT_AIR_IR_AIR_DIALECT

include "mlir/IR/OpBase.td"

def Air_Dialect : Dialect {
  let name = "air";
  let summary = "albert dialect demo template";
  let description = [{
    This dialect is just a demo template to show how to build a MLIR dialects step-by-step
  }];
  let cppNamespace = "::mlir::air";
}

class Air_Op<string mnemonic, list<OpTrait> traits = []> : Op<Air_Dialect, mnemonic, traits>;

#endif // HELLOWORLD_DIALECT_AIR_IR_AIR_DIALECT
