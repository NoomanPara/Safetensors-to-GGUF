# CMake generated Testfile for 
# Source directory: D:/Flux to GGUF/llama.cpp/examples/eval-callback
# Build directory: D:/Flux to GGUF/llama.cpp/build/examples/eval-callback
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(test-eval-callback "D:/Flux to GGUF/llama.cpp/build/bin/Debug/llama-eval-callback.exe" "--hf-repo" "ggml-org/models" "--hf-file" "tinyllamas/stories260K.gguf" "--model" "stories260K.gguf" "--prompt" "hello" "--seed" "42" "-ngl" "0")
  set_tests_properties(test-eval-callback PROPERTIES  LABELS "eval-callback;curl" _BACKTRACE_TRIPLES "D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;8;add_test;D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(test-eval-callback "D:/Flux to GGUF/llama.cpp/build/bin/Release/llama-eval-callback.exe" "--hf-repo" "ggml-org/models" "--hf-file" "tinyllamas/stories260K.gguf" "--model" "stories260K.gguf" "--prompt" "hello" "--seed" "42" "-ngl" "0")
  set_tests_properties(test-eval-callback PROPERTIES  LABELS "eval-callback;curl" _BACKTRACE_TRIPLES "D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;8;add_test;D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(test-eval-callback "D:/Flux to GGUF/llama.cpp/build/bin/MinSizeRel/llama-eval-callback.exe" "--hf-repo" "ggml-org/models" "--hf-file" "tinyllamas/stories260K.gguf" "--model" "stories260K.gguf" "--prompt" "hello" "--seed" "42" "-ngl" "0")
  set_tests_properties(test-eval-callback PROPERTIES  LABELS "eval-callback;curl" _BACKTRACE_TRIPLES "D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;8;add_test;D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(test-eval-callback "D:/Flux to GGUF/llama.cpp/build/bin/RelWithDebInfo/llama-eval-callback.exe" "--hf-repo" "ggml-org/models" "--hf-file" "tinyllamas/stories260K.gguf" "--model" "stories260K.gguf" "--prompt" "hello" "--seed" "42" "-ngl" "0")
  set_tests_properties(test-eval-callback PROPERTIES  LABELS "eval-callback;curl" _BACKTRACE_TRIPLES "D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;8;add_test;D:/Flux to GGUF/llama.cpp/examples/eval-callback/CMakeLists.txt;0;")
else()
  add_test(test-eval-callback NOT_AVAILABLE)
endif()
