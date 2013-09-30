((root, factory) ->
  if typeof exports is "object"
    module.exports = factory()
  else if typeof define is "function" and define.amd
    define([], factory)
  else
    root.jspecSuite = factory()

  null
)(@, () ->
  new jspec.Suite("jspec", () ->
    #= ExpectationSpec.coffee
  )
)
