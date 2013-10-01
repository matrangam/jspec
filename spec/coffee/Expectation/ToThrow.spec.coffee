@example("Expectation::ToThrow() when test value doesnt throw an error and an expected error is not provided should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow()
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)

@example("Expectation::ToThrow() when test value doesnt throw an error and an expected error is provided a constructor should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow(Error)
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)

@example("Expectation::ToThrow() when test value doesnt throw an error and an expected error is provided an error should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow(new Error())
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)
