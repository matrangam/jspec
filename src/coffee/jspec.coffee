((root, factory) ->
  if typeof exports is "object"
    module.exports = factory()
  else if typeof define is "function" and define.amd
    define([], factory)
  else
    root.jspec = factory()

  null
)(@, () ->
  class Example
    ## Constructor

    constructor: (description, block) ->
      @_block = block
      @_description = description

    ## Public Instance Methods

    Execute: (context) => @_getBlock().apply(new ExampleBlockDelegate(context))

    GetDescription: () => @_description

    ## Protected Instance Properties

    _block: null
    _description: null

    ## Protected Instance Methods

    _getBlock: () => @_block

  class ExampleBlockDelegate
    ## Constructor

    constructor: (context) ->
      @_context = context

    ## Public Instance Methods

    expect: (testValue) =>
      # TODO: Create and return a new AssertionDelegate(new Expectatio(testValue))
      new Expectation(testValue).BuildAssertionDelegate()

    get: (name) => @_getContext().GetVariableValue(name)

    set: (name, block) =>
      @_getContext().RegisterVariableBlock(name, block)
      null

    subject: (block = null) =>
      if arguments.length is 0
        @_getContext().GetSubject()
      else
        @_getContext().SetSubjectBlock(block)
        null

    ## Protected Instance Properties

    _context: null

    ## Protected Instance Methods

    _getContext: () => @_context

  class ExampleContext
    ## Public Instance Methods

    GetSubject: () => @_subject ?= @_getSubjectBlock().apply(@_getSubjectBlockDelegate())

    GetVariableValue: (name) =>
      variableBlock = @_getVariableBlocks()[name]

      # TODO: Determine whether this should actually throw an error.
      return undefined unless variableBlock?

      unless variableBlock.evaluated
        variableBlock.value = variableBlock.block.apply(@_getVariableBlockDelegate())
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
    _subjectBlockDelegate: null
    _variableBlockDelegate: null
    _variableBlocks: null

    ## Protected Instance Methods

    _getSubjectBlock: () => @_subjectBlock

    _getSubjectBlockDelegate: () => @_subjectBlockDelegate ?= new ExampleContextSubjectBlockDelegate(@GetVariableValue)

    _getVariableBlockDelegate: () => @_variableBlockDelegate ?= new ExampleContextVariableBlockDelegate(@GetVariableValue)

    _getVariableBlocks: () => @_variableBlocks ?= {}

  class ExampleContextSubjectBlockDelegate
    ## Constructor

    constructor: (getter) ->
      @_getter = getter

    ## Public Instance Methods

    get: (name) => @_getGetter()(name)

    ## Protected Instance Properties

    _getter: null

    ## Protected Instance Methods

    _getGetter: () => @_getter

  class ExampleContextVariableBlockDelegate
    ## Constructor

    constructor: (getter) ->
      @_getter = getter

    ## Public Instance Methods

    get: (name) => @_getter(name)

  class Expectation
    ## Constructor

    constructor: (testValue) ->
      @_testValue = testValue

    ## Protected Instance Properties

    _testValue: null

    ## Public Instance Methods

    BuildAssertionDelegate: () =>
      NotToBeFalse: @NotToBeFalse
      NotToBeNull: @NotToBeNull
      NotToBeTrue: @NotToBeTrue
      NotToBeUndefined: @NotToBeUndefined
      ToBeFalse: @ToBeFalse
      ToBeNull: @ToBeNull
      ToBeTrue: @ToBeTrue
      ToBeUndefined: @ToBeUndefined
      not:
        to:
          be:
            false: @NotToBeFalse
            null: @NotToBeNull
            true: @NotToBeTrue
            undefined: @NotToBeUndefined
      to:
        be:
          false: @ToBeFalse
          null: @ToBeNull
          true: @ToBeTrue
          undefined: @ToBeUndefined

    NotToBeFalse: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} not to be false") if @_getTestValue() is false
      true

    NotToBeNull: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} not to be null") if @_getTestValue() is null
      true

    NotToBeUndefined: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} not to be undefined") if @_getTestValue() is undefined
      true

    NotToBeTrue: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} not to be true") if @_getTestValue() is true
      true

    ToBeFalse: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} to be false") unless @_getTestValue() is false
      true

    ToBeNull: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} to be null") unless @_getTestValue() is null
      true

    ToBeUndefined: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} to be undefined") unless @_getTestValue() is undefined
      true

    ToBeTrue: () =>
      throw new ExpectationError("Expected #{@_getTestValue()} to be true") unless @_getTestValue() is true
      true

    ## Protected Instance Methods

    _getTestValue: () => @_testValue

  class ExpectationError
    ## Constructor

    constructor: (message) ->
      @_message = message

    ## Public Instance Methods

    GetMessage: () => @_message

  @jspec =
    Example: Example
    ExampleContext: ExampleContext
    ExpectationError: ExpectationError

  @jspec
)
