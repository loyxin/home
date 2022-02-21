# gtest

## TestSuit/TestCase

```cpp
TEST(CalculatorTestSuit, testAddMethod)
//   TestSuit Name     TestCase name
{
    Calculator calc;		            // Arrange
    auto actual = calc.add(1, 2);	// Act
    ASSERT_EQ(3, actual);		    // Assert
	EXPECT_EQ(expected, actual);
}
```

对于 TEST 函数， TestSuit Name，TestCase name just name

TEST_F 函数 test fixture

```cpp
TEST_F(TestFixtureName, testName) {
    // equal to testsuite name
    // test body
}
static void SetUpTestCase();	// before all test
static void TearDownTestCase();	// after all tests
virtual void SetUp(void);		// before each test
virtual void TearDown(void);	// after each test

class testsuitename : public testing::Test {
    protected:
    void SetUp() override
    {}
}
```

each TEST will generate a class
