@class("Expectation", () ->
  @method("NotToBeFalse", () ->
    #= Expectation/NotToBeFalse.spec.coffee
  )
  @method("NotToBeNull", () ->
    #= Expectation/NotToBeNull.spec.coffee
  )
  @method("NotToBeTrue", () ->
    #= Expectation/NotToBeTrue.spec.coffee
  )
  @method("NotToBeUndefined", () ->
    #= Expectation/NotToBeUndefined.spec.coffee
  )
  @method("ToBeFalse", () ->
    #= Expectation/ToBeFalse.spec.coffee
  )
  @method("ToBeNull", () ->
    #= Expectation/ToBeNull.spec.coffee
  )
  @method("ToBeTrue", () ->
    #= Expectation/ToBeTrue.spec.coffee
  )
  @method("ToBeUndefined", () ->
    #= Expectation/ToBeUndefined.spec.coffee
  )
  @method("ToEqual", () ->
    #= Expectation/ToEqual.spec.coffee
  )
  @method("ToThrow", () ->
    #= Expectation/ToThrow.spec.coffee
  )
)
