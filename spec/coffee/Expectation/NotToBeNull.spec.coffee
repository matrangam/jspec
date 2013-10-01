@example("NotToBeNull() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).NotToBeNull()).ToThrow(jspec.ExpectationError)
)

@example("NotToBeNull() when test value is undefined should not throw", () ->
  @expect(() -> new jspec.Expectation(undefined).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is false should not throw", () ->
  @expect(() -> new jspec.Expectation(false).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is true should not throw", () ->
  @expect(() -> new jspec.Expectation(true).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is an integer should not throw", () ->
  @expect(() -> new jspec.Expectation(1).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is a float should not throw", () ->
  @expect(() -> new jspec.Expectation(1.1).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is a string should not throw", () ->
  @expect(() -> new jspec.Expectation("string").NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is an array should not throw", () ->
  @expect(() -> new jspec.Expectation([]).NotToBeNull()).NotToThrow()
)

@example("NotToBeNull() when test value is an object should not throw", () ->
  @expect(() -> new jspec.Expectation({}).NotToBeNull()).NotToThrow()
)
