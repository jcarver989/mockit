# @import widget.coffee


class Notification extends Widget
  @defaults:
    type: "success"
    flat: false
    light: false

  constructor: (opts = Notification.defaults) ->
    @element = $("""
      <div class="notification">
        <a href="#" class="close-link">X</a>
        <h3>Notification</h3>
        <p>Some message</p>
      </div>
    """)

    @element.addClass(opts.type || Notification.defaults.type)
    @element.addClass("flat")  if opts.flat
    @element.addClass("light") if opts.light

    super(@element, opts)
