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
    successes = 0

    displayResult = (r) ->
      switch
        when r instanceof ExpectationError then r.GetMessage()
        when r instanceof Error then r.message
        else r

    for exampleDatum in @_getExampleData()
      result = null
      try
        exampleDatum.example.Execute(new ExampleContext())
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
        [exampleDatum.path, exampleDatum.example.GetDescription()].join(" ")
        displayResult(result)
      )

    console.log("Total:", total, "Failures:", failures, "Successes:", successes)

  ## Protected Instance Methods

  _getExampleData: () => @_exampleData
