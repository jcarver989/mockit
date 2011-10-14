class BoundingBox
  constructor: (@child, opts = {}) ->
    @box = $("""
      <div class='bounding-box'>
        <a href="#" class='close-box' alt='close'>close</a>
      </div>
    """)
    @box.append(@child)

    child = @child
    @box.resizable({
      alsoResize: child
      handles: 'se'
      containment: 'parent'
    })

    @box.draggable({
      grid: [25, 25]
      containment:  'parent'
    })

    @bind_events()
    @disable()
    @append(opts.container)

  bind_events: ->
    time = 200
    @box.mouseenter (e) =>
      setTimeout(@enable, time)

    @box.mouseleave (e) =>
      setTimeout(@disable, time) unless @box.hasClass("ui-resizable-resizing")

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


  append: (target) ->
    target.append(@box)
    @set_dimensions()
