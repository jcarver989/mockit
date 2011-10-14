$(document).ready(function() {
  var container;
  container = $(".canvas").first();
  new Button({
    container: container
  });
  new GradientBox({
    container: container
  });
  new Menu({
    container: container
  });
  $(".canvas").delegate(".close-box", 'click', function(e) {
    var box;
    box = $(e.target).parent();
    return box.fadeOut(200, function() {
      return box.remove();
    });
  });
  return $(".top-menu").delegate(".create-widget", "click", function(e) {
    var class_name, target;
    target = $(this);
    e.preventDefault();
    class_name = target.attr('data-widget');
    return new window[class_name]({
      container: container
    });
  });
});