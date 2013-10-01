@example("PendingExampleError() when not provided a message should set the message to null", () ->
  @expect(new jspec.PendingExampleError().GetMessage()).ToBeNull()
)

@example("PendingExampleError() when provided null should set the message to null", () ->
  @expect(new jspec.PendingExampleError(null).GetMessage()).ToBeNull()
)

@example("PendingExampleError() when provided undefined should set the message to null", () ->
  @expect(new jspec.PendingExampleError(undefined).GetMessage()).ToBeNull()
)

@example("PendingExampleError() when provided a string should set the message to it", () ->
  @expect(new jspec.PendingExampleError("message").GetMessage()).ToEqual("message")
)
