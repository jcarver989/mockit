# @import bounding_box.coffee

class Widget
  constructor: (@element, opts = {}) ->
    @bounding_box  = new BoundingBox(@element, opts)


  append: (target) ->
    @bounding_box.append(target)
