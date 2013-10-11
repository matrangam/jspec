# Array

@example("when test value is an array and expected value is the same array should not throw", () ->
  testValue = []
  @expect(() -> new jspec.Expectation(testValue).ToBe(testValue)).NotToThrow()
)

@example("when test value is an array and expected value is a different array should not throw", () ->
  testValue = []
  @expect(() -> new jspec.Expectation(testValue).ToBe([])).ToThrow(jspec.ExpectationError)
)

# False

@example("when test value is false and expected value is false should not throw", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(false)).NotToThrow()
)

@example("when test value is false and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(true)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(null)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(undefined)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe("string")).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is a false as a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe("false")).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is a float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(1.1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is 0 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(0)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe(1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe([])).ToThrow(jspec.ExpectationError)
)

@example("when test value is false and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBe({})).ToThrow(jspec.ExpectationError)
)

# Float

@example("when test value is a float and expected value is the same float should not throw", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(1.1)).NotToThrow()
)

@example("when test value is a float and expected value is a different float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(1.2)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(null)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(undefined)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(false)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(true)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe("string")).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is the same float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe("1.1")).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe(1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe([])).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBe({})).ToThrow(jspec.ExpectationError)
)

# Integer

@example("when test value is an integer and expected value is the same integer should not throw", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(1)).NotToThrow()
)

@example("when test value is an integer and expected value is a different integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(2)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(null)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(undefined)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(false)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(true)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe("string")).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is the same integer as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe("1")).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe(1.1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe([])).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBe({})).ToThrow(jspec.ExpectationError)
)

# Object

@example("when test value is an array and expected value is the same array should not throw", () ->
  testValue = {}
  @expect(() -> new jspec.Expectation(testValue).ToBe(testValue)).NotToThrow()
)

@example("when test value is an array and expected value is a different array should not throw", () ->
  testValue = {}
  @expect(() -> new jspec.Expectation(testValue).ToBe({})).ToThrow(jspec.ExpectationError)
)

# String

@example("when test value is a string and expected value is the same string should not throw", () ->
  @expect(() -> new jspec.Expectation("string").ToBe("string")).NotToThrow()
)

@example("when test value is a string and expected value is a different string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe("notstring")).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(null)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(undefined)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(false)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(true)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer string and expected value is the same integer value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("1").ToBe(1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe(1.1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer float string and expected value is the same float value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("1.1").ToBe(1.1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe([])).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBe({})).ToThrow(jspec.ExpectationError)
)

# True

@example("when test value is true and expected value is true should not throw", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(true)).NotToThrow()
)

@example("when test value is true and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(false)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(null)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(undefined)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe("string")).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is a true as a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe("true")).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is a float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(1.1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is 1 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(1)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe(0)).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe([])).ToThrow(jspec.ExpectationError)
)

@example("when test value is true and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBe({})).ToThrow(jspec.ExpectationError)
)
