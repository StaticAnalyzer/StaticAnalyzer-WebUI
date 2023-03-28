# Google Test Framework

## How to write your test?

[CMakeLists.txt](CMakeLists.txt) and [hello_test.cpp](hello_test.cpp) is a simple demo of using google test. 

The [CMakeLists.txt](CMakeLists.txt) is reusable. 

Macros provided in `gtest/gtest.h` can be found [here](https://google.github.io/googletest/reference/testing.html). These macros is helpful for writing unit tests in `cpp`.

## How to run your test?

`cd` to the project director of analyzer, and run

```shell
mkdir cmake-build-debug
cd cmake-build-debug
cmake -G Ninja .. # no need to specify any variables now
ctest
```

Then you'll get a test result like below:

```shell
Test project /home/njucs/StaticAnalyzer-WebUI/src/Analyzer/cmake-build-debug
    Start 1: HelloTest.BasicAssertions1
1/3 Test #1: HelloTest.BasicAssertions1 .......   Passed    0.01 sec
    Start 2: HelloTest.BasicAssertions2
2/3 Test #2: HelloTest.BasicAssertions2 .......***Failed    0.01 sec
    Start 3: HelloTest2.BasicAssertions1
3/3 Test #3: HelloTest2.BasicAssertions1 ......   Passed    0.02 sec

67% tests passed, 1 tests failed out of 3

Total Test time (real) =   0.06 sec

The following tests FAILED:
	  2 - HelloTest.BasicAssertions2 (Failed)
Errors while running CTest
Output from these tests are in: /home/njucs/StaticAnalyzer-WebUI/src/Analyzer/cmake-build-debug/Testing/Temporary/LastTest.log
Use "--rerun-failed --output-on-failure" to re-run the failed cases verbosely.
```

To see failed test verbosely, run

```ctest
ctest --rerun-failed --output-on-failure
```

You'll get:

```shell
Test project /home/njucs/StaticAnalyzer-WebUI/src/Analyzer/cmake-build-debug
    Start 2: HelloTest.BasicAssertions2
1/1 Test #2: HelloTest.BasicAssertions2 .......***Failed    0.00 sec
Running main() from /home/njucs/StaticAnalyzer-WebUI/src/Analyzer/cmake-build-debug/_deps/googletest-src/googletest/src/gtest_main.cc
Note: Google Test filter = HelloTest.BasicAssertions2
[==========] Running 1 test from 1 test suite.
[----------] Global test environment set-up.
[----------] 1 test from HelloTest
[ RUN      ] HelloTest.BasicAssertions2
/home/njucs/StaticAnalyzer-WebUI/src/Analyzer/tests/test_env/hello_test.cpp:14: Failure
Expected equality of these values:
  "hello"
  "world"
/home/njucs/StaticAnalyzer-WebUI/src/Analyzer/tests/test_env/hello_test.cpp:16: Failure
Expected: (7 * 6) != (42), actual: 42 vs 42
[  FAILED  ] HelloTest.BasicAssertions2 (0 ms)
[----------] 1 test from HelloTest (0 ms total)

[----------] Global test environment tear-down
[==========] 1 test from 1 test suite ran. (0 ms total)
[  PASSED  ] 0 tests.
[  FAILED  ] 1 test, listed below:
[  FAILED  ] HelloTest.BasicAssertions2

 1 FAILED TEST


0% tests passed, 1 tests failed out of 1

Total Test time (real) =   0.03 sec

The following tests FAILED:
	  2 - HelloTest.BasicAssertions2 (Failed)
Errors while running CTest
```

