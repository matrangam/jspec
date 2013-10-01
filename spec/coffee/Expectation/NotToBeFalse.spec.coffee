@example("Expectation::NotToBeFalse() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is false should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).NotToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::NotToBeFalse() when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).NotToBeFalse()).NotToThrow()
)

@example("Expectation::NotToBeFalse() when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).NotToBeFalse()).NotToThrow()
)
