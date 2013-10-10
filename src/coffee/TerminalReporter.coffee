class TerminalReporter extends Reporter
  ## Constructor

  constructor: (process) ->
    @_process = process

  ## Reporter Overrides

  _finished: (endTime) =>
    @_getProcess().stdout.write("\n\n")

    total = 0
    completed = 0
    failed = 0
    passed = 0
    pending = 0

    for id, exampleWrapper of @_getExampleWrappers()
      total++
      completed++ if exampleWrapper.GetStatus() is SuiteRunner.ExampleWrapper.STATUS.EXECUTED

      switch exampleWrapper.GetResult()
        when SuiteRunner.ExampleWrapper.RESULT.FAILED
          @_getProcess().stdout.write("##{exampleWrapper.GetId()} [FAILED ] #{exampleWrapper.GetExampleDescription()}\n")
          @_getProcess().stdout.write("#{exampleWrapper.GetMessage()}\n\n") if exampleWrapper.GetMessage()?
          failed++
        when SuiteRunner.ExampleWrapper.RESULT.PASSED
          passed++
        when SuiteRunner.ExampleWrapper.RESULT.PENDING
          @_getProcess().stdout.write("##{exampleWrapper.GetId()} [PENDING] #{exampleWrapper.GetExampleDescription()}\n")
          @_getProcess().stdout.write("#{exampleWrapper.GetMessage()}\n\n") if exampleWrapper.GetMessage()?
          pending++

    @_getProcess().stdout.write("Total: #{total}, Completed: #{completed}, Failed: #{failed}, Pending: #{pending}, Passed: #{passed}\n")
    @_getProcess().stdout.write("Time: #{endTime - @_getStartTime()}ms\n")

  _initialize: () => null

  _report: (exampleWrapper) =>
    @_getProcess().stdout.write(
      switch exampleWrapper.GetResult()
        when SuiteRunner.ExampleWrapper.RESULT.PENDING then "*"
        when SuiteRunner.ExampleWrapper.RESULT.PASSED then "+"
        when SuiteRunner.ExampleWrapper.RESULT.FAILED then "-"
    )

  ## Protected Instance Properties

  _process: null

  ## Protected Instance Methods

  _getProcess: () => @_process
