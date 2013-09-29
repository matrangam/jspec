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

    Execute: () => @_getBlock().apply(@_buildBlockDelegate())

    GetDescription: () => @_description

    ## Protected Instance Properties

    _block: null
    _description: null

    ## Protected Instance Methods

    _buildBlockDelegate: () => new ExampleBlockDelegate()

    _getBlock: () => @_block

  class ExampleBlockDelegate
    ## Public Instance Methods

    expect: (testValue) => new Expectation(testValue).BuildAssertionDelegate()

  class ExpectationError
    ## Constructor

    constructor: (message) ->
      @_message = message

    ## Public Instance Methods

    GetMessage: () => @_message

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

  @jspec =
    Example: Example
    Expectation: Expectation
    ExpectationError: ExpectationError

  @jspec
)
