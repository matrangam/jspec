@example("Expectation::ToBeNull when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).ToBeNull()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is undefined should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is false should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeNull when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeNull()).ToThrow(jspec.ExpectationError)
)
