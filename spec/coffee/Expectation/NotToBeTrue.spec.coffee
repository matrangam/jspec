@example("Expectation::NotToBeTrue() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is undefined should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is false should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).NotToBeTrue()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeTrue() when test value is 1 should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(0).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).NotToBeTrue()).NotToThrow()
)

@example("Expectation::NotToBeTrue() when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).NotToBeTrue()).NotToThrow()
)
