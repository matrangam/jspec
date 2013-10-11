class Expectation
  ## Constructor

  constructor: (testValue) ->
    @_testValue = testValue

  ## Protected Instance Properties

  _testValue: null

  ## Public Instance Methods

  NotToBeFalse: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} not to be false") if @_getTestValue() is false
    true

  NotToBeNull: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} not to be null") if @_getTestValue() is null
    true

  NotToBeTrue: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} not to be true") if @_getTestValue() is true
    true

  NotToBeUndefined: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} not to be undefined") if @_getTestValue() is undefined
    true

  NotToThrow: (unexpectedError = null) =>
    thrownError = null

    try
      @_getTestValue()()
    catch error
      thrownError = error

    displayError = if unexpectedError? then unexpectedError else "an error"

    if thrownError?
      if unexpectedError?
        if thrownError.constructor is unexpectedError or unexpectedError is thrownError
          throw new ExpectationError("Expected #{@_getTestValue()} not to throw #{displayError} but threw #{thrownError}")
      else
        throw new ExpectationError("Expected #{@_getTestValue()} not to throw #{displayError} but threw #{thrownError}")

    true

  ToBe: (expectedValue) =>
    throw new ExpectationError("Expected #{@_getTestValue()} to be #{expectedValue}") unless @_getTestValue() is expectedValue
    true

  ToBeFalse: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} to be false") unless @_getTestValue() is false
    true

  ToBeNull: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} to be null") unless @_getTestValue() is null
    true

  ToBeTrue: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} to be true") unless @_getTestValue() is true
    true

  ToBeUndefined: () =>
    throw new ExpectationError("Expected #{@_getTestValue()} to be undefined") unless @_getTestValue() is undefined
    true

  ToEqual: (expectedValue) =>
    throw new ExpectationError("Expected #{@_getTestValue()} to equal #{expectedValue}") unless @_getTestValue() is expectedValue
    true

  ToThrow: (expectedError = null) =>
    thrownError = null

    try
      @_getTestValue()()
    catch error
      thrownError = error

    displayError = if expectedError? then expectedError else "an error"

    unless thrownError?
      throw new ExpectationError("Expected #{@_getTestValue()} to throw #{displayError} but did not throw an error")

    if expectedError? and expectedError isnt thrownError.constructor and expectedError isnt thrownError
      throw new ExpectationError("Expected #{@_getTestValue()} to throw #{displayError} but threw #{thrownError}")

    true

  ## Protected Instance Methods

  _getTestValue: () => @_testValue
