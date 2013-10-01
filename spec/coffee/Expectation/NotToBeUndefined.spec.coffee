@example("Expectation::NotToBeUndefined when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is undefined should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).NotToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is false should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeUndefined when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
)
