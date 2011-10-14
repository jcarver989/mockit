# @import widget.coffee

class Menu extends Widget
  @defaults:
    color: "green"
  
  constructor: (opts = Menu.defaults) ->
    @element = $("""
      <div class='inset-button-group'>
        <a href='#' class='active'>One</a>
        <a href='#'>Two</a>
        <a href='#'>Three</a>
        <a href='#'>Four</a>
      </div>
    """)

    @element.addClass(opts.color || Menu.defaults.color)

    super(@element, opts)
