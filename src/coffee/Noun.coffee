class Noun
  ## Constructor

  constructor: (name, block) ->
    @_block = block
    @_name = name

    @_block.apply(@_getBlockScope())

  ## Public Instance Methods

  GetExamples: () => @_examples ?= []

  GetName: () => @_name

  GetNouns: () => @_nouns ?= []

  ## Protected Instance Properties

  _block: null
  _blockScope: null
  _examples: null
  _name: null
  _nouns: null

  ## Protected Instance Methods

  _getBlockScope: () => @_blockScope ?= new NounBlockScope(@_registerExample, @_registerNoun)

  _registerExample: (description, block) =>
    @GetExamples().push(new Example(description, block))
    null

  _registerNoun: (name, block) =>
    @GetNouns().push(new Noun(name, block))
    null
