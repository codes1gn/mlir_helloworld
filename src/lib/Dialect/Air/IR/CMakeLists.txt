add_mlir_dialect_library(HELLOWORLDAirDialect
    AirDialect.cpp

    # include dir path to the gen headers
    ADDITIONAL_HEADER_DIRS
    ${PROJECT_SOURCE_DIR}/include/Dialect/Air

    # use DEPENDS to specify depfiles for td generation
    DEPENDS
    MLIRAirOpsIncGen

    # use LINK_LIBS PUBLIC to add target deps on other libs
    LINK_LIBS PUBLIC
    MLIRIR
    )
