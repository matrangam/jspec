class ExampleEnvironment
  ## Public Instance Methods

  GetSubject: () => @_subject ?= @_getSubjectBlock().apply(@_getSubjectBlockScope())

  GetVariableValue: (name) =>
    variableBlock = @_getVariableBlocks()[name]

    # TODO: Determine whether this should actually throw an error.
    return undefined unless variableBlock?

    unless variableBlock.evaluated
      variableBlock.value = variableBlock.block.apply(@_getVariableBlockScope())
      variableBlock.evaluated = true

    variableBlock.value

  RegisterVariableBlock: (name, block) =>
    @_getVariableBlocks()[name] =
      block: block
      evaluated: false
      value: undefined

    null

  SetSubjectBlock: (block) =>
    @_subjectBlock = block
    null

  ## Protected Instance Properties

  _subjectBlock: null
  _subjectBlockScope: null
  _variableBlocks: null
  _variableBlockScope: null

  ## Protected Instance Methods

  _getSubjectBlock: () => @_subjectBlock

  _getSubjectBlockScope: () => @_subjectBlockScope ?= new ExampleEnvironmentSubjectBlockScope(@GetVariableValue)

  _getVariableBlocks: () => @_variableBlocks ?= {}

  _getVariableBlockScope: () => @_variableBlockScope ?= new ExampleEnvironmentVariableBlockScope(@GetVariableValue)
