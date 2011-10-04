MongoDocument = require('./mongo_document').MongoDocument
MongoTimestamps = require('./mongo_document').MongoTimestamps
include = require('./mongo_document').include


# Todo: move to model file
base62  = require './base_62.coffee'

class Signup
  @collection = "signups"
  include.apply(this, [MongoDocument])
  include.apply(this, [MongoTimestamps])

  constructor: (data_hash) ->
    @email = data_hash.email
    @referral_link = "http://mock.it/#{base62.random_encode()}"

  save: (callback) ->
    Signup.create {
      email: @email
      referral_link: @referral_link
    }, callback

# get a db connection
Signup.connect()

module.exports = Signup
