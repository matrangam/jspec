# Array

@example("Expectation::ToEqual() when test value is an array", () ->
  @pending()
)

# False

@example("Expectation::ToEqual() when test value is false and expected value is false should not throw", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(false)).NotToThrow()
)

@example("Expectation::ToEqual() when test value is false and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(true)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(null)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(undefined)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual("string")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is a false as a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual("false")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is a float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(1.1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is 0 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(0)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual(1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual([])).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is false and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToEqual({})).ToThrow(jspec.ExpectationError)
)

# Float

@example("Expectation::ToEqual() when test value is a float and expected value is the same float should not throw", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(1.1)).NotToThrow()
)

@example("Expectation::ToEqual() when test value is a float and expected value is a different float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(1.2)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(null)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(undefined)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(false)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(true)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual("string")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is the same float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual("1.1")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual(1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual([])).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a float and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToEqual({})).ToThrow(jspec.ExpectationError)
)

# Integer

@example("Expectation::ToEqual() when test value is an integer and expected value is the same integer should not throw", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(1)).NotToThrow()
)

@example("Expectation::ToEqual() when test value is an integer and expected value is a different integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(2)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(null)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(undefined)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(false)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(true)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual("string")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is the same integer as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual("1")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual(1.1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual([])).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToEqual({})).ToThrow(jspec.ExpectationError)
)

# Object

@example("Expectation::ToEqual() when test value is an object", () ->
  @pending()
)

# String

@example("Expectation::ToEqual() when test value is a string and expected value is the same string should not throw", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual("string")).NotToThrow()
)

@example("Expectation::ToEqual() when test value is a string and expected value is a different string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual("notstring")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(null)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(undefined)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(false)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(true)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer string and expected value is the same integer value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("1").ToEqual(1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual(1.1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is an integer float string and expected value is the same float value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("1.1").ToEqual(1.1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual([])).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is a string and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToEqual({})).ToThrow(jspec.ExpectationError)
)

# True

@example("Expectation::ToEqual() when test value is true and expected value is true should not throw", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(true)).NotToThrow()
)

@example("Expectation::ToEqual() when test value is true and expected value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(false)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(null)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(undefined)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual("string")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is a true as a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual("true")).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is a float as a string value should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(1.1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is 1 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(1)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual(0)).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual([])).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToEqual() when test value is true and expected value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToEqual({})).ToThrow(jspec.ExpectationError)
)
