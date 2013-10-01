@example("ToBeFalse() when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is undefined should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is false should not throw", () ->
  @expect(() -> new jspec.Expectation(false).ToBeFalse()).NotToThrow()
)

@example("ToBeFalse() when test value is true should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is 0 should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(0).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is an integer should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is a float should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is a string should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is an array should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("ToBeFalse() when test value is an object should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeFalse()).ToThrow(jspec.ExpectationError)
)
