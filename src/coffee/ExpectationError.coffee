class ExpectationError
  ## Constructor

  constructor: (message) ->
    @_message = message

  ## Public Instance Methods

  GetMessage: () => @_message
