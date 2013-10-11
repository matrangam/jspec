((root, factory) ->
  if typeof exports is "object"
    module.exports = factory(require("../../src/js/jspec-latest.js"))
  else if typeof define is "function" and define.amd
    define(["jspec"], factory)
  else
    root.jspecSuite = factory(root.jspec)

  null
)(@, (jspec) ->
  new jspec.Suite("jspec", () ->
    @class("Expectation", () ->
      #= Expectation.spec.coffee
    )
    @class("ExpectationError", () ->
      #= ExpectationError.spec.coffee
    )
    @class("PendingExampleError", () ->
      #= PendingExampleError.spec.coffee
    )
  )
)
