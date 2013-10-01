@example("NotToBeUndefined() when test value is null should not throw", () ->
  @expect(() -> new jspec.Expectation(null).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).NotToBeUndefined()).ToThrow(jspec.ExpectationError)
)

@example("NotToBeUndefined() when test value is false should not throw", () ->
  @expect(() -> new jspec.Expectation(false).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is true should not throw", () ->
  @expect(() -> new jspec.Expectation(true).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is an integer should not throw", () ->
  @expect(() -> new jspec.Expectation(1).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is a float should not throw", () ->
  @expect(() -> new jspec.Expectation(1.1).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is a string should not throw", () ->
  @expect(() -> new jspec.Expectation("string").NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is an array should not throw", () ->
  @expect(() -> new jspec.Expectation([]).NotToBeUndefined()).NotToThrow()
)

@example("NotToBeUndefined() when test value is an object should not throw", () ->
  @expect(() -> new jspec.Expectation({}).NotToBeUndefined()).NotToThrow()
)
