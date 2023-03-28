cmake_minimum_required(VERSION 3.14)
project(seexperiment)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

find_program(LLVM_CONFIG llvm-config)
if(NOT LLVM_CONFIG)
    message(FATAL_ERROR "Command `llvm-config` not found")
else()
    message(STATUS "Found llvm-config: ${LLVM_CONFIG}")
endif()

execute_process(
        COMMAND ${LLVM_CONFIG} --prefix
        OUTPUT_VARIABLE LLVM_PREFIX
        OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(LLVM_CONFIG ${LLVM_PREFIX}/bin/llvm-config)
# specify LLVM include dir
set(LLVM_INCLUDE ${LLVM_PREFIX}/include)
# specify LLVM lib dir
set(LLVM_LIB ${LLVM_PREFIX}/lib)

# run `llvm-config --libs` to get llvm libs list, and output it to variable LLVM_LIBS
execute_process(
  COMMAND ${LLVM_CONFIG} --libs
  OUTPUT_VARIABLE LLVM_LIBS
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

# define CLANG_LIBS: some clang libs to be used in link time
# !!! DO NOT change the order of the libs !!!
# libs will be linked in this order, and changing the order could lead to link errors
set(CLANG_LIBS
  clangTooling
  clangFrontendTool
  clangFrontend
  clangDriver
  clangSerialization
  clangCodeGen
  clangParse
  clangSema
  clangStaticAnalyzerFrontend
  clangStaticAnalyzerCheckers
  clangStaticAnalyzerCore
  clangAnalysis
  clangARCMigrate
  clangRewriteFrontend
  clangEdit
  clangAST
  clangASTMatchers
  clangLex
  clangBasic
)

# define OTHER_LIBS: other libs to be used in link time
set(OTHER_LIBS pthread z dl curses)

include_directories(include ${LLVM_INCLUDE})
link_directories(${LLVM_LIB})

add_subdirectory(lib)
add_subdirectory(tools)

enable_testing()
add_subdirectory(tests)
