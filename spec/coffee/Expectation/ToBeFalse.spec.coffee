@example("Expectation::ToBeFalse when test value is null should throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(null).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is undefined should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(undefined).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is false should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(false).ToBeFalse()).NotToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is true should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(true).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is an integer should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is a float should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation(1.1).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is a string should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation("string").ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is an array should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation([]).ToBeFalse()).ToThrow(jspec.ExpectationError)
)

@example("Expectation::ToBeFalse when test value is an object should not throw an ExpectationError", () ->
  @expect(() -> new jspec.Expectation({}).ToBeFalse()).ToThrow(jspec.ExpectationError)
)
