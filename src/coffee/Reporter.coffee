class Reporter
  ## Public Instance Methods

  Finished: (endTime) =>
    @_finished(endTime)

  Initialize: (exampleWrappers, startTime) =>
    @_startTime = startTime
    @_exampleWrappers = exampleWrappers

    @_initialize()

  ## Public Instance Methods

  Report: (id, passed, result) =>
    @_report(id, passed, result)

  ## Overridable Protected Instance Methods

  _finished: (endTime) => null

  _initialize: () => null

  _report: (id, passed, result) => null

  ## Protected Instance Properties

  _exampleWrappers: null

  _startTime: null

  ## Protected Instance Methods

  _getExampleWrappers: () => @_exampleWrappers

  _getStartTime: () => @_startTime
