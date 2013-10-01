class SuiteRunner
  ## Constructor

  constructor: (suite) ->
    @_exampleData = []

    initialPath = [suite]
    @_processExamples(initialPath, suite.GetExamples())
    @_processNouns(initialPath, suite.GetNouns())

  _processExample: (initialPath, example) => @_pushExampleDatum(@_exampleData, (pathItem for pathItem in initialPath), example)

  _processExamples: (initialPath, examples) => @_processExample(initialPath, example) for example in examples

  _processNoun: (initialPath, noun) =>
    initialPath = (pathItem for pathItem in initialPath)
    initialPath.push(noun)
    @_processExamples(initialPath, noun.GetExamples())
    @_processNouns(initialPath, noun.GetNouns())

  _processNouns: (initialPath, nouns) => @_processNoun(initialPath, noun) for noun in nouns

  _pushExampleDatum: (exampleData, path, example) =>
    exampleData.push(
      path: path
      example: example
    )

  ## Public Instance Methods

  Run: (reporter) =>
    startTime = new Date().getTime()

    buildExampleExecutor = (example) =>
      () => example.Execute(new ExampleEnvironment())

    handleExampleFailure = (error) => error

    buildExampleSuccessHandler = (i) =>
      (ret) =>
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

    reporter.Initialize(@_getExampleData(), startTime)

    Q
      .allSettled(
        for exampleDatum, i in @_getExampleData()
          Q
            .fcall(buildExampleExecutor(exampleDatum.example))
            .fail(handleExampleFailure)
            .then(buildExampleSuccessHandler(i))
      )
      .then((promises) => reporter.Finished(new Date().getTime()))

  ## Protected Instance Methods

  _getExampleData: () => @_exampleData
