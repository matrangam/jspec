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

  _report: (id) =>
    exampleView = @_getExampleView(id)

    exampleView.Update()

    @_completedCount++
    @_updateCompletedCount()

    switch exampleView.GetExampleWrapper().GetResult()
      when SuiteRunner.ExampleWrapper.RESULT.PENDING
        @_pendingCount++
        @_updatePendingCount()
      when SuiteRunner.ExampleWrapper.RESULT.PASSED
        @_passedCount++
        @_updatePassedCount()
      when SuiteRunner.ExampleWrapper.RESULT.FAILED
        @_failedCount++
        @_updateFailedCount()

    @_updateTimeElapsedCountElement(new Date().getTime())

  ## Protected Instance Properties

  $: null
  _bodyElement: null
  _completedCount: 0
  _completedExamplesCountElement: null
  _completedExamplesElement: null
  _completedExamplesPercentElement: null
  _exampleListElement: null
  _exampleViews: null
  _failedCount: 0
  _failedExamplesCountElement: null
  _failedExamplesElement: null
  _failedExamplesPercentElement: null
  _passedCount: 0
  _passedExamplesCountElement: null
  _passedExamplesElement: null
  _passedExamplesPercentElement: null
  _pendingCount: 0
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
    @_getCompletedExamplesCountElement().text(@_completedCount)
    @_getCompletedExamplesPercentElement().text("#{(@_completedCount / @_getExampleWrappers().length * 100)}%")

  _updateFailedCount: () =>
    @_getFailedExamplesCountElement().text(@_failedCount)
    @_getFailedExamplesPercentElement().text("#{(@_failedCount / @_getExampleWrappers().length * 100)}%")

  _updatePassedCount: () =>
    @_getPassedExamplesCountElement().text(@_passedCount)
    @_getPassedExamplesPercentElement().text("#{(@_passedCount / @_getExampleWrappers().length * 100)}%")

  _updatePendingCount: () =>
    @_getPendingExamplesCountElement().text(@_pendingCount)
    @_getPendingExamplesPercentElement().text("#{(@_pendingCount / @_getExampleWrappers().length * 100)}%")

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

  _buildDescription: () =>
    [
      (
        for pathItem in @_getExampleWrapper().GetPath()
          switch
            when pathItem instanceof Noun then pathItem.GetName()
            when pathItem instanceof Suite then pathItem.GetName()
            else pathItem
      ).join("/")
      @_getExampleWrapper().GetExample().GetDescription()
    ].join(" ")

  _getDescriptionElement: () =>
    @_descriptionElement ?= @$("<span>")
      .text(@_buildDescription())

  _getExampleWrapper: () => @_exampleWrapper

  _getIconElement: () =>
    @_iconElement ?= @$("<span>")
      .html("?")

  _getResultElement: () => @_resultElement ?= $("<span>")
