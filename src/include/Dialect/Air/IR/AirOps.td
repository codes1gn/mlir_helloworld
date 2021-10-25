#ifndef HELLOWORLD_DIALECT_AIR_IR_AIR_OPS
#define HELLOWORLD_DIALECT_AIR_IR_AIR_OPS

include "AirDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def Air_IdentityOp : Air_Op<"air", [NoSideEffect,
    SameOperandsAndResultType]> {
      let summary = "The Identity Ops that returns the input as it is";
      let description = [{
        I am lazy to write this part of code, just leave it blank.
      }];
      let arguments = (ins F32:$inp);
      let results = (outs F32:$out);
      // can use $inp, $out, directives
      let assemblyFormat = [{
        $inp `<` `+` attr-dict `:` type($inp)
      }];
}

#endif // HELLOWORLD_DIALECT_AIR_IR_AIR_OPS
