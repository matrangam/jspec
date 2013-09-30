class ExampleContextVariableBlockScope
  ## Constructor

  constructor: (getter) ->
    @_getter = getter

  ## Public Instance Methods

  get: (name) => @_getter(name)
