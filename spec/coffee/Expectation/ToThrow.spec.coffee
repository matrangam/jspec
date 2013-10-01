@example("when test value doesn't throw an error and an expected error is not provided should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow()
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)

@example("when test value doesn't throw an error and an expected error is provided a constructor should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow(Error)
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)

@example("when test value doesn't throw an error and an expected error is provided an error should throw an ExpectationError", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> null).ToThrow(new Error())
  catch error
    thrownError = error

  @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
)

@example("when test value does throw an error and an expected error is not provided should not throw", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> throw new Error()).ToThrow()
  catch error
    thrownError = error

  @expect(thrownError).ToBeNull()
)

@example("when test value does throw an error and an expected error is provided a constructor that matches should not throw", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> throw new Error()).ToThrow(Error)
  catch error
    thrownError = error

  @expect(thrownError).ToBeNull()
)

@example("when test value does throw an error and an expected error is provided an error that matches should not throw", () ->
  thrownError = null

  try
    new jspec.Expectation(() -> throw new Error("error")).ToThrow(new Error("error"))
  catch error
    thrownError = error

  @pending("@expect(thrownError).ToBeNull()")
)
