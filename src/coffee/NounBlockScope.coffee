class NounBlockScope
  ## Constructor

  constructor: (exampleRegisterer, nounRegisterer) ->
    @_exampleRegisterer = exampleRegisterer
    @_nounRegisterer = nounRegisterer

  ## Public Instance Methods

  construct: (block) => @_getNounRegisterer()("constructor()", block)

  class: (name, block) => @_getNounRegisterer()(name, block)

  example: (description, block) => @_getExampleRegisterer()(description, block)

  describe: (name, block) => @_getNounRegisterer()(name, block)

  method: (name, block) => @_getNounRegisterer()("#{name}()", block)

  ## Protected Instance Properties

  _exampleRegisterer: null
  _nounRegisterer: null

  ## Protected Instance Methods

  _getExampleRegisterer: () => @_exampleRegisterer

  _getNounRegisterer: () => @_nounRegisterer
