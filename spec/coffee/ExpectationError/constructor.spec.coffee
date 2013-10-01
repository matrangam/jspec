@example("constructor when not provided a message should set the message to null", () ->
  @expect(new jspec.ExpectationError().GetMessage()).ToBeNull()
)

@example("constructor when provided null should set the message to null", () ->
  @expect(new jspec.ExpectationError(null).GetMessage()).ToBeNull()
)

@example("constructor when provided undefined should set the message to null", () ->
  @expect(new jspec.ExpectationError(undefined).GetMessage()).ToBeNull()
)

@example("constructor when provided a string should set the message to it", () ->
  @expect(new jspec.ExpectationError("message").GetMessage()).ToEqual("message")
)
