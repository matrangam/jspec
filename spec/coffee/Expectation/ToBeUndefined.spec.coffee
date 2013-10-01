@example("Expectation::ToBeUndefined() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is undefined should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeUndefined()).NotToThrow()
)

@example("Expectation::ToBeUndefined() when test value is false should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeUndefined() when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeUndefined()).ToThrow(jspec.ExpectationError)
)
