class PendingExampleError
  ## Constructor

  constructor: (message = null) ->
    @_message = (message ? null)

  ## Public Instance Methods

  GetMessage: () => @_message
