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

    total = 0
    failures = 0
    pendings = 0
    successes = 0

    getResultData = (exampleError) ->
      switch
        when exampleError instanceof ExpectationError
          value: exampleError.GetMessage()
          passed: false
        when exampleError instanceof PendingExampleError
          value: exampleError.GetMessage()
          passed: null
        when exampleError instanceof Error
          value: exampleError.message
          passed: false
        else
          value: null
          passed: true

    reporter.Initialize(@_getExampleData(), startTime)

    for exampleDatum, i in @_getExampleData()
      exampleError = null
      try
        exampleDatum.example.Execute(new ExampleEnvironment())
      catch error
        exampleError = error

      result = getResultData(exampleError)

      total++
      switch result.passed
        when null then pendings++
        when true then successes++
        when false then failures++

      reporter.Report(i, result.passed, result.value)

    reporter.Finished(new Date().getTime())

  ## Protected Instance Methods

  _getExampleData: () => @_exampleData
