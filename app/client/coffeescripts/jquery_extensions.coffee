(($) ->
  $.fn.postForm = (callback) ->
    url = this.attr('action')
    data = this.serialize()
    $.post(url, data, (response) ->
      callback(response) if callback?
    )
)(jQuery)
