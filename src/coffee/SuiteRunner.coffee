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

  Run: () =>
    total = 0
    failures = 0
    pendings = 0
    successes = 0

    getResultData = (exampleError) ->
      switch
        when exampleError instanceof ExpectationError
          value: exampleError.GetMessage()
          passed: false
          icon: "\u2612"
        when exampleError instanceof PendingExampleError
          value: exampleError.GetMessage()
          passed: null
          icon: "\u2610"
        when exampleError instanceof Error
          value: exampleError.message
          passed: false
          icon: "\u2612"
        else
          value: null
          passed: true
          icon: "\u2611"

    for exampleDatum in @_getExampleData()
      exampleError = null
      try
        exampleDatum.example.Execute(new ExampleContext())
      catch error
        exampleError = error

      result = getResultData(exampleError)

      total++
      switch result.passed
        when null then pendings++
        when true then successes++
        when false then failures++

      console.log(
        result.icon
        ([exampleDatum.path, exampleDatum.example.GetDescription()].join(" ") + ":")
        result.value
      )

    console.log("Total:", total, "Failures:", failures, "Successes:", successes, "Pending:", pendings)

  ## Protected Instance Methods

  _getExampleData: () => @_exampleData
