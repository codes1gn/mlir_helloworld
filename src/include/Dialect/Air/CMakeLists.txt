# TODO here we can try cancer project basicpy setting, using 
# naive mlir_tablegen rather than assemblied add_mlir_dialect

# TIP 1 this function is add_mlir_dialect(dialect_name dialect_namespace)
add_mlir_dialect(AirOps air)

# TIP 2 use add_mlir_doc to generate documentations
add_mlir_doc(AirOps AirDialect . -gen-dialect-doc)
