require './environments.coffee'
app     = require './boot.coffee'

Signup = require('./signup.coffee')

valid_email = (email) -> true

# future helpers
app.helpers({
})


app.get '/', (req, res) ->
  res.render 'index', {
    title: 'Mock.it'
  }



# TODO: Move to own controller class
class SignupResponses
  @invalid_email_json:
    status: "error"
    msg: "Invalid Email"

  @already_signed_up: (referral_link) ->
    status: "registered"
    referral_link: referral_link

  @successful_signup: (referral_link) ->
    status: "success"
    referral_link: referral_link
    
  @db_error:
    status: "error"
    msg: "Error trying to save your email"

app.post '/signup', (req, res) ->
  unless req.body? && req.body.email? && valid_email(req.body.email)
    res.json SignupResponses.ivalid_email_json
    return

  email = req.body.email

  Signup.find { email: email }, (error, results) ->
    # if not unique
    if results.length > 0
      response = SignupResponses.already_signed_up(results[0].referral_link)
      res.json(response)
      return

    signup = new Signup({
      email: email
    })

    signup.save (error, signup) ->
      if error?
        res.json(db_error)
        return

      res.json SignupResponses.successful_signup(signup.referral_link)


# Boot the server
app.listen(3000)

console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env)
