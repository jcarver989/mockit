$(document).ready ->
  container = $(".canvas").first()

  new Button({
    container: container 
  })

  new GradientBox({
    container: container
  })

  new Menu({
    container: container
  })


  $(".canvas").delegate ".close-box", 'click', (e) ->
    box = $(e.target).parent()
    box.fadeOut 200, ->
      box.remove()

  $(".top-menu").delegate ".create-widget", "click", (e) ->
    target = $(this)
    e.preventDefault()

    class_name = target.attr('data-widget')
    new window[class_name]({
      container: container
    })
