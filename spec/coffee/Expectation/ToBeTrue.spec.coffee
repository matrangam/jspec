@example("Expectation::ToBeTrue() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is true should not throw", () ->
  @expect(() -> new jspec.Expectation(true).ToBeTrue()).NotToThrow()
)

@example("Expectation::ToBeTrue() when test value is 1 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(0).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeTrue() when test value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeTrue()).ToThrow(jspec.ExpectationError)
)
