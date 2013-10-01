@example("when test value is null should not", () ->
  @expect(() -> new jspec.Expectation(null).ToBeNull()).NotToThrow()
)

@example("when test value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("when test value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeNull()).ToThrow(jspec.ExpectationError)
)
