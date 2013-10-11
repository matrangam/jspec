class ExpectationAssertionDelegate
  ## Constructor

  constructor: (expectation) ->
    @_expectation = expectation

    @not.to.be.false = @NotToBeFalse
    @not.to.be.null = @NotToBeNull
    @not.to.be.true = @NotToBeTrue
    @not.to.be.undefined = @NotToBeUndefined
    @not.to.throw = @NotToThrow

    @to.be = @ToBe
    @to.be.false = @ToBeFalse
    @to.be.null = @ToBeNull
    @to.be.true = @ToBeTrue
    @to.be.undefined = @ToBeUndefined
    @to.equal = @ToEqual
    @to.throw = @ToThrow

  NotToBeFalse: () => @_getExpectation().NotToBeFalse()

  NotToBeNull: () => @_getExpectation().NotToBeNull()

  NotToBeTrue: () => @_getExpectation().NotToBeTrue()

  NotToBeUndefined: () => @_getExpectation().NotToBeUndefined()

  NotToThrow: (unexpectedError = null) => @_getExpectation().NotToThrow(unexpectedError)

  ToBe: (expectedValue) => @_getExpectation().ToBe(expectedValue)

  ToBeFalse: () => @_getExpectation().ToBeFalse()

  ToBeNull: () => @_getExpectation().ToBeNull()

  ToEqual: (expectedValue) => @_getExpectation().ToEqual(expectedValue)

  ToThrow: (expectedError = null) => @_getExpectation().ToThrow(expectedError)

  ToBeTrue: () => @_getExpectation().ToBeTrue()

  ToBeUndefined: () => @_getExpectation().ToBeUndefined()

  not:
    to:
      be:
        false: null
        null: null
        true: null
        undefined: null
    throw: null

  to:
    be:
      false: null
      null: null
      true: null
      undefined: null
    equal: null
    throw: null

  ## Protected Instance Properties

  _expectation: null

  ## Protected Instance Methods

  _getExpectation: () => @_expectation
