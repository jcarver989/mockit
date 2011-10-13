class BoundingBox
  constructor: (@child) ->
    @box = $("<div class='bounding-box'>")
    @box.append(@child)

    child = @child
    @box.resizable({
      alsoResize: child
      handles: 'se'
    })

    @box.draggable({
      grid: [25, 25]
    })

    @bind_events()
    @disable()

  bind_events: ->
    @box.mouseenter (e) =>
      setTimeout(@enable, 200)

    @box.mouseleave (e) =>
      setTimeout(@disable, 200) unless @box.hasClass("ui-resizable-resizing")

    @box.click (e) =>
      e.preventDefault()
      @enable()

  set_dimensions: ->
    child = @child

    padding_top     = parseInt child.css("padding-top")
    padding_right   = parseInt child.css("padding-right")
    padding_bottom  = parseInt child.css("padding-bottom")
    padding_left    = parseInt child.css("padding-left")
    width           = parseInt child.css("width")
    height          = parseInt child.css("height")

    full_width = width + padding_left + padding_right
    full_height = height + padding_top + padding_bottom

    @box.css({
      width:  full_width
      height: full_height
    })

  disable: =>
    @box.resizable("option", "disabled", true)
    @box.draggable("option", "disabled", true)

  enable: =>
    @box.resizable("option", "disabled", false)
    @box.draggable("option", "disabled", false)


  append: ->
    $("body").append(@box)
    @set_dimensions()


class Widget
  constructor: (@element) ->
    @bounding_box  = new BoundingBox(@element)
    @bounding_box.append()


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

    super(@element)


class GradientBox extends Widget
  @defaults:
    color: "green"
    striped: false

  constructor: (opts = GradientBox.defaults) ->
    @element = $("""
    <div class='gradient-box'>
      <h3>100</h3>
      <small>of something</small>
    </div>
    """)

    @element.addClass(opts.color || GradientBox.defaults.color)
    @element.addClass("striped") if opts.striped

    super(@element)


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

    super(@element)

$(document).ready ->
  new Button()
  new GradientBox()
  new Menu()
