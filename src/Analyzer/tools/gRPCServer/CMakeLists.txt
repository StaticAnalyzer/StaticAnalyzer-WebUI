add_executable(algServer server.cpp)

target_link_libraries(algServer
  algproto
  checkers
  framework
  ${CLANG_LIBS}
  ${LLVM_LIBS}
  ${OTHER_LIBS}
)
