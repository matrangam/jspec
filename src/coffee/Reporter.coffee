class Reporter
  ## Public Instance Methods

  Finished: (endTime) =>
    @_finished(endTime)

  Initialize: (exampleData, startTime) =>
    @_startTime = startTime
    @_exampleData = exampleData

    @_initialize()

  ## Public Instance Methods

  Report: (id, passed, result) =>
    @_report(id, passed, result)

  ## Overridable Protected Instance Methods

  _finished: (endTime) => null

  _initialize: () => null

  _report: (id, passed, result) => null

  ## Protected Instance Properties

  _exampleData: null

  _startTime: null

  ## Protected Instance Methods

  _getExampleData: () => @_exampleData

  _getStartTime: () => @_startTime
