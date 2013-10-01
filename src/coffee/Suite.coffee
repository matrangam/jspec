class Suite
  ## Constructor

  constructor: (name, block) ->
    @_block = block
    @_name = name

    @_block.apply(@_getBlockScope())

  ## Public Instance Methods

  GetExamples: () => @_examples ?= []

  GetName: () => @_name

  Run: (reporter) =>
    new SuiteRunner(@).Run(reporter)

    null

  ## Protected Instance Properties

  _block: null
  _blockScope: null
  _examples: null
  _name: name

  ## Protected Instance Methods

  _getBlockScope: () => @_blockScope ?= new SuiteBlockScope(@_registerExample)

  _registerExample: (description, block) =>
    @GetExamples().push(new Example(description, block))
    null
