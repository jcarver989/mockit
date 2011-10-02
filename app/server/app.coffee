require './environments.coffee'
app     = require './boot.coffee'
base62  = require './base_62.coffee'


app.helpers({
})


app.get '/', (req, res) ->
  res.render 'index', {
    title: 'Express'
  }


app.post '/signup', (req, res) ->
  if req.body? && req.body.email?
    email = req.body.email
    referral_id = base62.random_encode()

    res.json({
      status: "success"
      referral_link: "http://mock.it/#{referral_id}"
    })
  else
    res.json({
      status: "error"
      msg: "Invalid Email"
    })

app.listen(3000)

console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env)
