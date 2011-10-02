(function() {
  (function($) {
    return $.fn.postForm = function(callback) {
      var data, url;
      url = this.attr('action');
      data = this.serialize();
      return $.post(url, data, function(response) {
        if (callback != null) {
          return callback(response);
        }
      });
    };
  })(jQuery);
}).call(this);
