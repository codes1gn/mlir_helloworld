# configure all the cmake policies
cmake_minimum_required(VERSION 3.13.4)

if(POLICY CMP0068)
    cmake_policy(SET CMP0068 NEW)
    set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)
endif()

if(POLICY CMP0075)
  cmake_policy(SET CMP0075 NEW)
endif()

if(POLICY CMP0077)
  cmake_policy(SET CMP0077 NEW)
endif()

# configure project-only policies
project(cancer LANGUAGES CXX C)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ standard to conform to")

# configure mlir and llvm path
find_package(MLIR REQUIRED CONFIG)

message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# set mlir and llvm to CMAKE_MODULE_PATH
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_modules")

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)
set(LIT_ARGS_DEFAULT "-sv")
set(LLVM_LIT_ARGS "${LIT_ARGS_DEFAULT}" CACHE STRING "Default options for lit")
set(MLIR_BINARY_DIR ${CMAKE_BINARY_DIR})

# include cmake functions
include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

set(CANCER_BUILT_STANDALONE 1)
set(CANCER_TABLEGEN_ARGS "")

# include project-required headers
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})

# TODO this line includes the header files from ./src/include/
include_directories(${PROJECT_SOURCE_DIR}/src/include)
include_directories(${PROJECT_BINARY_DIR}/src/include)

link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

# configure for python env
set(CANCER_PYTHON_BINDINGS_VERSION_LOCKED 1 CACHE BOOL
    ¦  "Links to specific python libraries, resolving all symbols.")
find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
message(STATUS "Found python include dirs: ${Python_INCLUDE_DIRS}")
message(STATUS "Found python libraries: ${Python_LIBRARIES}")

add_subdirectory(src)

add_custom_target(helloworld)
add_dependencies(helloworld
    mlir-headers
    HELLOWORLDAirDialect
    )

