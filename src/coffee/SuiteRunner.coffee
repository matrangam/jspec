class SuiteRunner
  ## Constructor

  constructor: (suite) ->
    initialPath = [suite]
    @_processExamples(@_getExampleWrappers(), initialPath, suite.GetExamples())
    @_processNouns(@_getExampleWrappers(), initialPath, suite.GetNouns())

  _processExample: (container, initialPath, example) => container.push(new SuiteRunner.ExampleWrapper(container.length.toString(), (pathItem for pathItem in initialPath), example))

  _processExamples: (container, initialPath, examples) => @_processExample(container, initialPath, example) for example in examples

  _processNoun: (container, initialPath, noun) =>
    initialPath = (pathItem for pathItem in initialPath)
    initialPath.push(noun)
    @_processExamples(container, initialPath, noun.GetExamples())
    @_processNouns(container, initialPath, noun.GetNouns())

  _processNouns: (container, initialPath, nouns) => @_processNoun(container, initialPath, noun) for noun in nouns

  ## Public Instance Methods

  Run: (reporter) =>
    startTime = new Date().getTime()

    handleExampleFailure = (error) => error

    buildExamplePromise = (exampleWrapper) =>
      Q
        .resolve(null)
        .then(() => exampleWrapper.SetStatus(SuiteRunner.ExampleWrapper.STATUS.EXECUTING))
        .then(() => exampleWrapper.GetExample().Execute(new ExampleEnvironment()))
        .fail(handleExampleFailure)
        .then((ret) =>
          exampleWrapper.SetStatus(SuiteRunner.ExampleWrapper.STATUS.EXECUTED)

          switch
            when ret instanceof ExpectationError
              exampleWrapper.SetMessage(ret.GetMessage())
              exampleWrapper.SetResult(SuiteRunner.ExampleWrapper.RESULT.FAILED)
            when ret instanceof PendingExampleError
              exampleWrapper.SetMessage(ret.GetMessage())
              exampleWrapper.SetResult(SuiteRunner.ExampleWrapper.RESULT.PENDING)
            when ret instanceof Error
              exampleWrapper.SetMessage(ret.message)
              exampleWrapper.SetResult(SuiteRunner.ExampleWrapper.RESULT.FAILED)
            else
              exampleWrapper.SetResult(SuiteRunner.ExampleWrapper.RESULT.PASSED)

          reporter.Report(exampleWrapper)
        )

    reporter.Initialize(@_getExampleWrappers(), startTime)

    Q
      .allSettled(buildExamplePromise(exampleWrapper) for exampleWrapper in @_getExampleWrappers())
      .then((promises) => reporter.Finished(new Date().getTime()))

  ## Protected Instance Methods

  _getExampleWrappers: () => @_exampleWrappers ?= []

class SuiteRunner.ExampleWrapper
  ## Constructor

  constructor: (id, path, example) ->
    @_example = example
    @_id = id
    @_path = path

  ## Class Constants

  @RESULT ?= {}
  @RESULT.NONE = 0
  @RESULT.PENDING = 1
  @RESULT.FAILED = 2
  @RESULT.PASSED = 3

  @STATUS ?= {}
  @STATUS.WAITING = 0
  @STATUS.EXECUTING = 1
  @STATUS.EXECUTED = 2

  ## Public Instance Methods

  GetExample: () => @_example

  GetExampleDescription: () =>
    [
      (
        for pathItem in @GetPath()
          switch
            when pathItem instanceof Noun then pathItem.GetName()
            when pathItem instanceof Suite then pathItem.GetName()
            else pathItem
      ).join("/")
      @GetExample().GetDescription()
    ].join(" ")

  GetId: () => @_id

  GetMessage: () => @_message

  GetPath: () => @_path

  GetResult: () => @_result

  GetStatus: () => @_status

  SetMessage: (newMessage) =>
    @_message = newMessage
    null

  SetStatus: (newStatus) =>
    @_status = newStatus
    null

  SetResult: (newResult) =>
    @_result = newResult
    null

  ## Protected Instance Properties

  _example: null
  _id: null
  _message: null
  _path: null
  _result: @RESULT.NONE
  _status: @STATUS.WAITING
