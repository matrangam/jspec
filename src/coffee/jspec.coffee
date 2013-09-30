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

    Execute: (context) => @_getBlock().apply(new ExampleBlockScope(context))

    GetDescription: () => @_description

    ## Protected Instance Properties

    _block: null
    _description: null

    ## Protected Instance Methods

    _getBlock: () => @_block

  class ExampleBlockScope
    ## Constructor

    constructor: (context) ->
      @_context = context

    ## Public Instance Methods

    expect: (testValue) => new ExpectationAssertionDelegate(new Expectation(testValue))

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

    _getSubjectBlockScope: () => @_subjectBlockScope ?= new ExampleContextSubjectBlockScope(@GetVariableValue)

    _getVariableBlocks: () => @_variableBlocks ?= {}

    _getVariableBlockScope: () => @_variableBlockScope ?= new ExampleContextVariableBlockScope(@GetVariableValue)

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

  class ExampleContextVariableBlockScope
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

  class ExpectationAssertionDelegate
    ## Constructor

    constructor: (expectation) ->
      @_expectation = expectation

      @not.to.be.false = @NotToBeFalse
      @not.to.be.null = @NotToBeNull
      @not.to.be.true = @NotToBeTrue
      @not.to.be.undefined = @NotToBeUndefined

      @to.be.false = @ToBeFalse
      @to.be.null = @ToBeNull
      @to.be.true = @ToBeTrue
      @to.be.undefined = @ToBeUndefined

    NotToBeFalse: () => @_getExpectation().NotToBeFalse()

    NotToBeNull: () => @_getExpectation().NotToBeNull()

    NotToBeTrue: () => @_getExpectation().NotToBeTrue()

    NotToBeUndefined: () => @_getExpectation().NotToBeUndefined()

    ToBeFalse: () => @_getExpectation().ToBeFalse()

    ToBeNull: () => @_getExpectation().ToBeNull()

    ToBeTrue: () => @_getExpectation().ToBeTrue()

    ToBeUndefined: () => @_getExpectation().ToBeUndefined()

    not:
      to:
        be:
          false: null
          null: null
          true: null
          undefined: null
    to:
      be:
        false: null
        null: null
        true: null
        undefined: null

    ## Protected Instance Properties

    _expectation: null

    ## Protected Instance Methods

    _getExpectation: () => @_expectation

  class ExpectationError
    ## Constructor

    constructor: (message) ->
      @_message = message

    ## Public Instance Methods

    GetMessage: () => @_message

  class Suite
    ## Constructor

    constructor: (block) ->
      @_block = block

      @_block.apply(@_getBlockScope())

    ## Public Instance Methods

    Run: () =>
      console.group("Suite")

      total = 0
      failures = 0
      successes = 0

      displayResult = (r) ->
        switch
          when r instanceof ExpectationError then r.GetMessage()
          when r instanceof Error then r.message
          else r

      for example in @_getExamples()
        result = null
        try
          example.Execute(new ExampleContext())
          passed = true
        catch error
          result = error
          passed = false

        total++
        if passed
          successes++
        else
          failures++

        console.log(
          (if passed then "+" else "-")
          example.GetDescription()
          displayResult(result)
        )

      console.groupEnd()

      console.log("Total:", total, "Failures:", failures, "Successes:", successes)

      null

    ## Protected Instance Properties

    _blockScope: null
    _examples: null

    ## Protected Instance Methods

    _getBlockScope: () => @_blockScope ?= new SuiteBlockScope(@_registerExample)

    _getExamples: () => @_examples ?= []

    _registerExample: (description, block) =>
      @_getExamples().push(new Example(description, block))
      null

  class SuiteBlockScope
    ## Constructor

    constructor: (exampleRegisterer) ->
      @_exampleRegisterer = exampleRegisterer

    ## Public Instance Methods

    example: (description, block) => @_getExampleRegisterer()(description, block)

    ## Protected Instance Properties

    _exampleRegisterer: null

    ## Protected Instance Methods

    _getExampleRegisterer: () => @_exampleRegisterer

  @jspec =
    Example: Example
    ExampleContext: ExampleContext
    ExpectationError: ExpectationError
    Suite: Suite

  @jspec
)
