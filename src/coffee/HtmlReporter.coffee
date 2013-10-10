class HtmlReporter extends Reporter
  ## Constructor

  constructor: ($, bodyElementOrSelector) ->
    super()

    @$ = $
    @_bodyElement = @$(bodyElementOrSelector)

  ## Reporter Overrides

  _finished: (endTime) =>
    @_updateTimeElapsedCountElement(endTime)

  _initialize: () =>
    for exampleWrapper in @_getExampleWrappers()
      @_getExampleViews()[exampleWrapper.GetId()] = new HtmlReporter.ExampleView(@$, exampleWrapper)

    @_getBodyElement()
      .addClass("jspec")
      .append(
        $("<header>")
          .append(@_getTimeElapsedElement())
          .append(@_getTotalExamplesElement())
          .append(@_getCompletedExamplesElement())
          .append(@_getFailedExamplesElement())
          .append(@_getPendingExamplesElement())
          .append(@_getPassedExamplesElement())
      )
      .append(
        $("<article>")
          .append(@_getExampleListElement())
      )

    @_updateCompletedCount()
    @_updateFailedCount()
    @_updatePassedCount()
    @_updatePendingCount()
    @_getTotalExamplesCountElement().text(@_getExampleWrappers().length)

    @_getExampleListElement().append(@$("<li>").append(example.GetElement()) for id, example of @_getExampleViews())

  _report: (exampleWrapper) =>
    exampleView = @_getExampleView(exampleWrapper.GetId())

    exampleView.Update()

    @_updateCompletedCount()

    switch exampleView.GetExampleWrapper().GetResult()
      when SuiteRunner.ExampleWrapper.RESULT.PENDING
        @_updatePendingCount()
      when SuiteRunner.ExampleWrapper.RESULT.PASSED
        @_updatePassedCount()
      when SuiteRunner.ExampleWrapper.RESULT.FAILED
        @_updateFailedCount()

    @_updateTimeElapsedCountElement(new Date().getTime())

  ## Protected Instance Properties

  $: null
  _bodyElement: null
  _completedExamplesCountElement: null
  _completedExamplesElement: null
  _completedExamplesPercentElement: null
  _exampleListElement: null
  _exampleViews: null
  _failedExamplesCountElement: null
  _failedExamplesElement: null
  _failedExamplesPercentElement: null
  _passedExamplesCountElement: null
  _passedExamplesElement: null
  _passedExamplesPercentElement: null
  _pendingExamplesCountElement: null
  _pendingExamplesElement: null
  _pendingExamplesPercentElement: null
  _timeElapsedCountElement: null
  _timeElapsedElement: null
  _totalExamplesCountElement: null
  _totalExamplesElement: null

  ## Protected Instance Methods

  _getBodyElement: () => @_bodyElement

  _getCompletedExamplesCountElement: () =>
    @_completedExamplesCountElement ?= $("<dd>")
      .addClass("count")

  _getCompletedExamplesElement: () =>
    @_completedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Completed"))
      .append(@_getCompletedExamplesCountElement())
      .append(@_getCompletedExamplesPercentElement())

  _getCompletedExamplesPercentElement: () =>
    @_completedExamplesPercentElement ?= $("<dd>")
      .addClass("percent")

  _getExampleListElement: (index) => @_exampleListElement ?= $("<ol>")

  _getExampleView: (id) => (@_getExampleViews()[id] ? null)

  _getExampleViews: () => @_exampleViews ?= {}

  _getFailedExamplesCountElement: () =>
    @_failedExamplesCountElement ?= @$("<dd>")
      .addClass("count")

  _getFailedExamplesElement: () =>
    @_failedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Failed"))
      .append(@_getFailedExamplesCountElement())
      .append(@_getFailedExamplesPercentElement())

  _getFailedExamplesPercentElement: () =>
    @_failedExamplesPercentElement ?= $("<dd>")
      .addClass("percent")

  _getPassedExamplesCountElement: () =>
    @_passedExamplesCountElement ?= @$("<dd>")
      .addClass("count")

  _getPassedExamplesElement: () =>
    @_passedExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Passed"))
      .append(@_getPassedExamplesCountElement())
      .append(@_getPassedExamplesPercentElement())

  _getPassedExamplesPercentElement: () =>
    @_passedExamplesPercentElement ?= $("<dd>")
      .addClass("percent")

  _getPendingExamplesCountElement: () =>
    @_pendingExamplesCountElement ?= @$("<dd>")
      .addClass("count")

  _getPendingExamplesElement: () =>
    @_pendingExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Pending"))
      .append(@_getPendingExamplesCountElement())
      .append(@_getPendingExamplesPercentElement())

  _getPendingExamplesPercentElement: () =>
    @_pendingExamplesPercentElement ?= $("<dd>")
      .addClass("percent")

  _getTimeElapsedElement: () =>
    @_timeElapsedElement ?= @$("<dl>")
      .addClass("time-elapsed")
      .append(@$("<dt>").text("Runtime"))
      .append(@_getTimeElapsedCountElement())

  _getTimeElapsedCountElement: () =>
    @_timeElapsedCountElement ?= @$("<dd>")
      .addClass("count")

  _getTotalExamplesCountElement: () =>
    @_totalExamplesCountElement ?= @$("<span>")
      .addClass("count")

  _getTotalExamplesElement: () =>
    @_totalExamplesElement ?= @$("<dl>")
      .append(@$("<dt>").text("Total"))
      .append(
        @$("<dd>")
          .append(@_getTotalExamplesCountElement())
        )

  _updateCompletedCount: () =>
    completedCount = (null for id, exampleView of @_getExampleViews() when exampleView.GetExampleWrapper().GetStatus() is SuiteRunner.ExampleWrapper.STATUS.EXECUTED).length
    @_getCompletedExamplesCountElement().text(completedCount)
    @_getCompletedExamplesPercentElement().text("#{(completedCount / @_getExampleWrappers().length * 100)}%")

  _updateFailedCount: () =>
    failedCount = (null for id, exampleView of @_getExampleViews() when exampleView.GetExampleWrapper().GetResult() is SuiteRunner.ExampleWrapper.RESULT.FAILED).length
    @_getFailedExamplesCountElement().text(failedCount)
    @_getFailedExamplesPercentElement().text("#{(failedCount / @_getExampleWrappers().length * 100)}%")

  _updatePassedCount: () =>
    passedCount = (null for id, exampleView of @_getExampleViews() when exampleView.GetExampleWrapper().GetResult() is SuiteRunner.ExampleWrapper.RESULT.PASSED).length
    @_getPassedExamplesCountElement().text(passedCount)
    @_getPassedExamplesPercentElement().text("#{(passedCount / @_getExampleWrappers().length * 100)}%")

  _updatePendingCount: () =>
    pendingCount = (null for id, exampleView of @_getExampleViews() when exampleView.GetExampleWrapper().GetResult() is SuiteRunner.ExampleWrapper.RESULT.PENDING).length
    @_getPendingExamplesCountElement().text(pendingCount)
    @_getPendingExamplesPercentElement().text("#{(pendingCount / @_getExampleWrappers().length * 100)}%")

  _updateTimeElapsedCountElement: (endTime) => @_getTimeElapsedCountElement().text("#{endTime - @_getStartTime()}ms")

class HtmlReporter.ExampleView
  ## Constructor

  constructor: ($, exampleWrapper) ->
    @$ = $
    @_exampleWrapper = exampleWrapper

  ## Public Instance Methods

  GetElement: () =>
    @_element ?= @$("<div>")
      .append(@_getIconElement())
      .append(@_getDescriptionElement())
      .append(@_getResultElement())

  GetExampleWrapper: () => @_exampleWrapper

  Update: () =>
    @_getIconElement().html(
      switch @GetExampleWrapper().GetResult()
        when SuiteRunner.ExampleWrapper.RESULT.PENDING then "*"
        when SuiteRunner.ExampleWrapper.RESULT.PASSED then "+"
        when SuiteRunner.ExampleWrapper.RESULT.FAILED then "-"
    )
    @_getResultElement().text(@GetExampleWrapper().GetMessage() ? "")

  ## Protected Instance Properties

  _descriptionElement: null
  _element: null
  _exampleWrapper: null
  _resultElement: null
  _iconElement: null

  ## Protected Instance Methods

  _getDescriptionElement: () =>
    @_descriptionElement ?= @$("<span>")
      .text(@_getExampleWrapper().GetExampleDescription())

  _getExampleWrapper: () => @_exampleWrapper

  _getIconElement: () =>
    @_iconElement ?= @$("<span>")
      .html("?")

  _getResultElement: () => @_resultElement ?= $("<span>")
