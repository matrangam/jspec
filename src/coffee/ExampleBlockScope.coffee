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
