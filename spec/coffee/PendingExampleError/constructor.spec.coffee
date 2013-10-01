@example("constructor when not provided a message should set the message to null", () ->
  @expect(new jspec.PendingExampleError().GetMessage()).ToBeNull()
)

@example("constructor when provided null should set the message to null", () ->
  @expect(new jspec.PendingExampleError(null).GetMessage()).ToBeNull()
)

@example("constructor when provided undefined should set the message to null", () ->
  @expect(new jspec.PendingExampleError(undefined).GetMessage()).ToBeNull()
)

@example("constructor when provided a string should set the message to it", () ->
  @expect(new jspec.PendingExampleError("message").GetMessage()).ToEqual("message")
)
