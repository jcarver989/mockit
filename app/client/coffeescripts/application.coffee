ShareTemplates = {
  twitter: """
  <a class="twitter-share-button" 
     data-url="{{url}}"
     href="https://twitter.com/share" 
     data-count="none">
       Tweet
  </a>

  <script src="http://platform.twitter.com/widgets.js" 
          type="text/javascript">
  </script>
  """

  facebook: """
  <div id="fb-root">
    <script type="text/javascript">
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "http://connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>

    <div class="fb-like" 
         data-href="{{url}}" 
         data-send="false" 
         data-layout="button_count" 
         data-width="300" 
         data-show-faces="false" 
         data-font="arial">
    </div>
  </div>
  """

  linkedin: """
  <script src="http://platform.linkedin.com/in.js" type="text/javascript"></script>
<script type="IN/Share" data-url="{{url}}"></script>
  """
}


animate = (left, right, callback) ->
  speed = 400
  left.animate({ "margin-left": "0px"}, speed)
  right.animate({ "margin-right": "0px"}, speed, callback)

show_form = (form, support) -> 
  setTimeout(->
    form.fadeIn 200, ->
      form.animate({top: "30px"}, 200)
      support.fadeIn 200, ->
        support.animate({"margin-top": "40px"}, 200)
  , 100)

animate_page_transition = (title, signup, post_signup) ->
  signup.fadeOut(400, ->
    post_signup.fadeIn(200)
    $("#title").text(title)
    $("#subtitle").text("We'll notify you soon. Want in faster? Invite your friends with the link below, if they signup, you move faster in line")
  )

render_social_links = (link) ->
  render = Mustache.to_html
  data = { url: link }

  $("#referral-link").text(link)
  $("#twitter-share").html(render(ShareTemplates.twitter, data))
  $("#linkedin-share").html(render(ShareTemplates.linkedin, data))
  $("#facebook-share").html(render(ShareTemplates.facebook, data))


setup_signup = (signup, post_signup, signup_button) ->
  signup_button.click((e) ->
    e.preventDefault()

    $(this).text("wait...")

    signup.postForm (response) ->
      console.log(response)

      if response.status == "success"
        render_social_links(response.referral_link)
        animate_page_transition("Thanks for signing up", signup, post_signup)

      else if response.status == "registered"
        render_social_links(response.referral_link)
        animate_page_transition("You already signed up", signup, post_signup)

      else
        alert(response.msg)
  )

$(document).ready(->
  time_visible = 2000

  left    = $("#left-door")
  right   = $("#right-door")
  form    = $("#form")
  support = $("#supports")

  signup        = $("#signup")
  post_signup   = $("#post-signup")
  signup_button = $("#signup-button")

  setup_signup(signup, post_signup, signup_button)

  setTimeout(->
    animate(left, right, -> show_form(form, support))
  , 3000)
)
