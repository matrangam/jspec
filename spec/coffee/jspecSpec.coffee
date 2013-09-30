((root, factory) ->
  if typeof exports is "object"
    module.exports = factory()
  else if typeof define is "function" and define.amd
    define([], factory)
  else
    root.jspecSuite = factory()

  null
)(@, () ->
  new jspec.Suite("jspec", () ->
    # NotToBeFalse

    @example("Expectation::NotToBeFalse when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is undefined should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is false should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).NotToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeFalse when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).NotToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    # NotToBeNull

    @example("Expectation::NotToBeNull when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).NotToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeNull when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).NotToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    # NotToBeTrue

    @example("Expectation::NotToBeTrue when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).NotToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeTrue when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).NotToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    # NotToBeUndefined

    @example("Expectation::NotToBeUndefined when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).NotToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::NotToBeUndefined when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).NotToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    # ToBeFalse

    @example("Expectation::ToBeFalse when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).ToBeFalse()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeFalse when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).ToBeFalse()).ToThrow(jspec.ExpectationError)
    )

    # ToBeNull

    @example("Expectation::ToBeNull when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).ToBeNull()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeNull when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).ToBeNull()).ToThrow(jspec.ExpectationError)
    )

    # ToBeTrue

    @example("Expectation::ToBeTrue when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).ToBeTrue()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeTrue when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).ToBeTrue()).ToThrow(jspec.ExpectationError)
    )

    # ToBeUndefined

    @example("Expectation::ToBeUndefined when test value is null should throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(null).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is undefined should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(undefined).ToBeUndefined()).NotToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is false should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(false).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is true should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(true).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is an integer should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is a float should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation(1.1).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is a string should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation("string").ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is an array should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation([]).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    @example("Expectation::ToBeUndefined when test value is an object should not throw an ExpectationError", () ->
      @expect(() -> new jspec.Expectation({}).ToBeUndefined()).ToThrow(jspec.ExpectationError)
    )

    # ToThrow

    @example("Expectation::ToThrow when test value doesnt throw an error and an expected error is not provided should throw an ExpectationError", () ->
      thrownError = null

      try
        new jspec.Expectation(() -> null).ToThrow()
      catch error
        thrownError = error

      @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
    )

    @example("Expectation::ToThrow when test value doesnt throw an error and an expected error is provided a constructor should throw an ExpectationError", () ->
      thrownError = null

      try
        new jspec.Expectation(() -> null).ToThrow(Error)
      catch error
        thrownError = error

      @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
    )

    @example("Expectation::ToThrow when test value doesnt throw an error and an expected error is provided an error should throw an ExpectationError", () ->
      thrownError = null

      try
        new jspec.Expectation(() -> null).ToThrow(new Error())
      catch error
        thrownError = error

      @expect(thrownError instanceof jspec.ExpectationError).ToBeTrue()
    )
  )
)
