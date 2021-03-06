class SuiteBlockScope
  ## Constructor

  constructor: (exampleRegisterer, nounRegisterer) ->
    @_exampleRegisterer = exampleRegisterer
    @_nounRegisterer = nounRegisterer

  ## Public Instance Methods

  class: (name, block) => @_getNounRegisterer()(name, block)

  example: (description, block) => @_getExampleRegisterer()(description, block)

  describe: (name, block) => @_getNounRegisterer()(name, block)

  ## Protected Instance Properties

  _exampleRegisterer: null
  _nounRegisterer: null

  ## Protected Instance Methods

  _getExampleRegisterer: () => @_exampleRegisterer

  _getNounRegisterer: () => @_nounRegisterer
