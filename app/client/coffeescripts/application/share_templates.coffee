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


