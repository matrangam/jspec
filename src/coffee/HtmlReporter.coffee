class HtmlReporter
  ## Constructor

  constructor: ($, container) ->
    @$ = $
    @_container = @$(container)

  ## Public Instance Methods

  Initialize: (exampleData, startTime) =>
    @_startTime = startTime
    @_examples = (new HtmlReporter.Example(@$, exampleDatum) for exampleDatum in exampleData)

    @_getContainer()
      .append(@_getTimeElapsedElement())
      .append(@_getTotalExamplesElement())
      .append(@_getCompletedExamplesElement())
      .append(@_getFailedExamplesElement())
      .append(@_getPendingExamplesElement())
      .append(@_getPassedExamplesElement())
      .append(@_getExampleListElement())

    @_updateCompletedCount()
    @_updateFailedCount()
    @_updatePassedCount()
    @_updatePendingCount()
    @_getTotalExamplesCountElement().text(exampleData.length)

    @_getExampleListElement().append(@$("<li>").append(example.GetElement()) for example in @_getExamples())

  Report: (id, passed, result) =>
    example = @_getExample(id)

    example.Update(passed, result)

    @_completedCount++
    @_updateCompletedCount()

    switch passed
      when null
        @_pendingCount++
        @_updatePendingCount()
      when true
        @_passedCount++
        @_updatePassedCount()
      when false
        @_failedCount++
        @_updateFailedCount()

    @_updateTimeElapsedCountElement(new Date().getTime())

  Finished: (endTime) =>
    @_updateTimeElapsedCountElement(endTime)

  ## Protected Instance Properties

  $: null
  _completedCount: 0
  _completedExamplesCountElement: null
  _completedExamplesElement: null
  _container: null
  _exampleListElement: null
  _examples: null
  _failedCount: 0
  _failedExamplesCountElement: null
  _failedExamplesElement: null
  _passedCount: 0
  _passedExamplesCountElement: null
  _passedExamplesElement: null
  _pendingCount: 0
  _pendingExamplesCountElement: null
  _pendingExamplesElement: null
  _startTime: null
  _timeElapsedCountElement: null
  _timeElapsedElement: null
  _totalExamplesCountElement: null
  _totalExamplesElement: null

  ## Protected Instance Methods

  _getCompletedExamplesCountElement: () => @_completedExamplesCountElement ?= $("<span>")

  _getCompletedExamplesElement: () =>
    @_completedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Completed"))
      .append(
        @$("<dd>")
          .append(@_getCompletedExamplesCountElement())
      )

  _getContainer: () => @_container

  _getExample: (index) => (@_getExamples()[index] ? null)

  _getExampleListElement: (index) => @_exampleListElement ?= $("<ul>")

  _getExamples: () => @_examples

  _getFailedExamplesCountElement: () => @_failedExamplesCountElement ?= @$("<span>")

  _getFailedExamplesElement: () =>
    @_failedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Failed"))
      .append(
        @$("<dd>")
          .append(@_getFailedExamplesCountElement())
        )

  _getPassedExamplesCountElement: () => @_passedExamplesCountElement ?= @$("<span>")

  _getPassedExamplesElement: () =>
    @_passedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Passed"))
      .append(
        @$("<dd>")
          .append(@_getPassedExamplesCountElement())
        )

  _getPendingExamplesCountElement: () => @_pendingExamplesCountElement ?= @$("<span>")

  _getPendingExamplesElement: () =>
    @_pendingExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Pending"))
      .append(
        @$("<dd>")
          .append(@_getPendingExamplesCountElement())
        )

  _getStartTime: () => @_startTime

  _getTimeElapsedElement: () =>
    @_timeElapsedElement ?= @$("<dl>")
      .append(@$("<dt>").text("Time Elapsed"))
      .append(@_getTimeElapsedCountElement())

  _getTimeElapsedCountElement: () => @_timeElapsedCountElement ?= @$("<dd>")

  _getTotalExamplesCountElement: () => @_totalExamplesCountElement ?= @$("<span>")

  _getTotalExamplesElement: () =>
    @_totalExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Total"))
      .append(
        @$("<dd>")
          .append(@_getTotalExamplesCountElement())
        )

  _updateCompletedCount: () => @_getCompletedExamplesCountElement().text(@_completedCount)

  _updateFailedCount: () => @_getFailedExamplesCountElement().text(@_failedCount)

  _updatePassedCount: () => @_getPassedExamplesCountElement().text(@_passedCount)

  _updatePendingCount: () => @_getPendingExamplesCountElement().text(@_pendingCount)

  _updateTimeElapsedCountElement: (endTime) => @_getTimeElapsedCountElement().text("#{endTime - @_getStartTime()}ms")

class HtmlReporter.Example
  ## Constructor

  constructor: ($, exampleDatum) ->
    @$ = $
    @_exampleDatum = exampleDatum

  ## Public Instance Methods

  GetElement: () =>
    @_element ?= @$("<div>")
      .append(@_getIconElement())
      .append(@_getDescriptionElement())
      .append(@_getResultElement())

  Update: (passed, result) =>
    @_getIconElement().html(
      switch passed
        when null then "*"
        when true then "+"
        when false then "-"
    )
    @_getResultElement().text(result ? "")

  ## Protected Instance Properties

  _descriptionElement: null
  _element: null
  _exampleDatum: null
  _resultElement: null
  _iconElement: null

  ## Protected Instance Methods

  _getDescriptionElement: () =>
    @_descriptionElement ?= @$("<span>")
      .text([@_getExampleDatum().path, @_getExampleDatum().example.GetDescription()].join(" "))

  _getExampleDatum: () => @_exampleDatum

  _getIconElement: () =>
    @_iconElement ?= @$("<span>")
      .html("?")

  _getResultElement: () => @_resultElement ?= $("<span>")
