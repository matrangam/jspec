@example("PendingExampleError::GetMessage() should return the message provided to the constructor", () ->
  @expect(new jspec.PendingExampleError("message").GetMessage()).ToEqual("message")
)
