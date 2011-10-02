express = require 'express'
app     = require './boot.coffee'

app.configure ->
  app.set 'views', "#{__dirname}/../client/views"
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static("#{__dirname}/../../public")


app.configure 'development', ->
  app.use express.errorHandler({
    dumpExceptions: true
    showStack: true
  })

app.configure 'production', ->
  app.use express.errorHandler()
