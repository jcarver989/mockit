# @import widget.coffee

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

    super(@element, opts)
