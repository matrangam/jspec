class SuiteRunner
  ## Constructor

  constructor: (suite) ->
    initialPath = [suite]
    @_processExamples(@_getExampleWrappers(), initialPath, suite.GetExamples())
    @_processNouns(@_getExampleWrappers(), initialPath, suite.GetNouns())

  _processExample: (container, initialPath, example) => container.push(new SuiteRunner.ExampleWrapper((pathItem for pathItem in initialPath), example))

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

    buildExamplePromise = (exampleDatum, i) =>
      Q
        .resolve(null)
        .then(() => exampleDatum.GetExample().Execute(new ExampleEnvironment()))
        .fail(handleExampleFailure)
        .then((ret) =>
          result = switch
            when ret instanceof ExpectationError
              value: ret.GetMessage()
              passed: false
            when ret instanceof PendingExampleError
              value: ret.GetMessage()
              passed: null
            when ret instanceof Error
              value: ret.message
              passed: false
            else
              value: null
              passed: true

          reporter.Report(i, result.passed, result.value)
        )

    reporter.Initialize(@_getExampleWrappers(), startTime)

    Q
      .allSettled(buildExamplePromise(exampleDatum, i) for exampleDatum, i in @_getExampleWrappers())
      .then((promises) => reporter.Finished(new Date().getTime()))

  ## Protected Instance Methods

  _getExampleWrappers: () => @_exampleWrappers ?= []

class SuiteRunner.ExampleWrapper
  ## Constructor

  constructor: (path, example) ->
    @_path = path
    @_example = example

  ## Class Constants

  @STATUS ?= {}
  @STATUS.WAITING = 0
  @STATUS.RUNNING = 1
  @STATUS.PENDING = 2
  @STATUS.FAILED = 3
  @STATUS.SUCCEEDED = 4

  ## Public Instance Methods

  GetExample: () => @_example

  GetPath: () => @_path

  GetStatus: () => @_status

  ## Protected Instance Properties

  _example: null
  _path: null
  _status: @STATUS.WAITING
