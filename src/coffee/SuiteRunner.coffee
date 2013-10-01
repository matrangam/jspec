class SuiteRunner
  ## Constructor

  constructor: (suite) ->
    @_exampleData = []
    for example in suite.GetExamples()
      @_exampleData.push(
        path: [suite.GetName()]
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
