class Example
  ## Constructor

  constructor: (description, block) ->
    @_block = block
    @_description = description

  ## Public Instance Methods

  Execute: (context) => @_getBlock().apply(new ExampleBlockScope(context))

  GetDescription: () => @_description

  ## Protected Instance Properties

  _block: null
  _description: null

  ## Protected Instance Methods

  _getBlock: () => @_block
