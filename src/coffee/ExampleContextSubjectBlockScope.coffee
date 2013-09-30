class ExampleContextSubjectBlockScope
  ## Constructor

  constructor: (getter) ->
    @_getter = getter

  ## Public Instance Methods

  get: (name) => @_getGetter()(name)

  ## Protected Instance Properties

  _getter: null

  ## Protected Instance Methods

  _getGetter: () => @_getter
