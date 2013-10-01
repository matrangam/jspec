@example("should return the message provided to the constructor", () ->
  @expect(new jspec.ExpectationError("message").GetMessage()).ToEqual("message")
)
