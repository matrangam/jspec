class NounBlockScope
  ## Constructor

  constructor: (exampleRegisterer) ->
    @_exampleRegisterer = exampleRegisterer

  ## Public Instance Methods

  example: (description, block) => @_getExampleRegisterer()(description, block)

  ## Protected Instance Properties

  _exampleRegisterer: null

  ## Protected Instance Methods

  _getExampleRegisterer: () => @_exampleRegisterer
