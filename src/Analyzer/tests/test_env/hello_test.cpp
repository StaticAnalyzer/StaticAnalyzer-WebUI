#include <gtest/gtest.h>

// Demonstrate some basic successful assertions.
TEST(HelloTest, BasicAssertions1) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}

// Demonstrate some basic failed assertions.
TEST(HelloTest, BasicAssertions2) {
  // Expect two strings to be equal.
  EXPECT_STREQ("hello", "world");
  // Expect inequality.
  EXPECT_NE(7 * 6, 42);
}

// Demonstrate some basic successful assertions.
TEST(HelloTest2, BasicAssertions1) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}
