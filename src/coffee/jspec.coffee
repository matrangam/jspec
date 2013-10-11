((root, factory) ->
  if typeof exports is "object"
    module.exports = factory(require("q"))
  else if typeof define is "function" and define.amd
    define(["q"], factory)
  else
    root.jspec = factory(Q)

  null
)(@, (Q) ->
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
  #= Noun.coffee
  #= NounBlockScope.coffee
  #= Suite.coffee
  #= SuiteBlockScope.coffee
  #= SuiteRunner.coffee

  #= Reporter.coffee
  #= HtmlReporter.coffee
  #= TerminalReporter.coffee

  jspec =
    Example: Example
    ExampleEnvironment: ExampleEnvironment
    Expectation: Expectation
    ExpectationError: ExpectationError
    HtmlReporter: HtmlReporter
    PendingExampleError: PendingExampleError
    Suite: Suite
    TerminalReporter: TerminalReporter

  jspec
)
