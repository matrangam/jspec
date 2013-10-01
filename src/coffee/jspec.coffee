((root, factory) ->
  if typeof exports is "object"
    module.exports = factory()
  else if typeof define is "function" and define.amd
    define([], factory)
  else
    root.jspec = factory()

  null
)(@, () ->
  #= BaseError.coffee
  #= ExpectationError.coffee
  #= PendingExampleError.coffee

  #= Example.coffee
  #= ExampleBlockScope.coffee
  #= ExampleEnvironment.coffee
  #= ExampleEnvironmentSubjectBlockScope.coffee
  #= ExampleEnvironmentVariableBlockScope.coffee
  #= Expectation.coffee
  #= ExpectationAssertionDelegate.coffee
  #= Suite.coffee
  #= SuiteBlockScope.coffee
  #= SuiteRunner.coffee

  @jspec =
    Example: Example
    ExampleEnvironment: ExampleEnvironment
    Expectation: Expectation
    ExpectationError: ExpectationError
    PendingExampleError: PendingExampleError
    Suite: Suite

  @jspec
)
