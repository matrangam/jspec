class ConsoleReporter extends Reporter
  ## Constructor

  constructor: (console) ->
    @_console = console


  ## Reporter Overrides

  _initialize: () => console.log("Initialize")
