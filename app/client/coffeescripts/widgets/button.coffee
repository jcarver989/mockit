# @import widget.coffee

class Button extends Widget
  @defaults: 
    size: "large"
    color: "green"
    striped: false
    square: false
    pill: false
    bordered: false

  constructor: (opts = Button.defaults) ->
    @element = $("<a href='#' class='button'>Click me!</a>")

    @element.addClass(opts.size  || Button.defaults.size)
    @element.addClass(opts.color || Button.defaults.color)
    @element.addClass("striped")  if opts.striped
    @element.addClass("square")   if opts.square
    @element.addClass("pill")     if opts.pill
    @element.addClass("bordered") if opts.bordered

    super(@element, opts)

