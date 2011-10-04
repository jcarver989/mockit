
# Small ORM for MongoDocuments
# 

Db = require('mongodb').Db
Connection = require('mongodb').Connection
Server = require('mongodb').Server
BSON = require('mongodb').BSON
ObjectID = require('mongodb').ObjectID
db_config = require('./db.coffee')

include = (mixin) ->
  for key, val of mixin
    this[key] = val if mixin.hasOwnProperty(key)

class MongoDocument
  @connection: new Db("test", new Server(db_config.host, db_config.port, {}))
  @buffer: []
  @ready: false

  @before_save: []

  @connect: ->
    return if @ready

    @connection.open (error) =>
      @ready = true
      query() for query in @buffer

  @get_collection: (callback) ->
    @connection.collection @collection, (error, collection) =>
      return callback(error) if error?

      if !@ready
        @buffer.push -> callback(null, collection)
      else
        callback(null, collection)

  @all: (callback) ->
    @get_collection (error, collection) ->
      return callback(error) if error?

      collection.find().toArray (error, results) ->
        callback(error, results)
  
  @find: (query, callback) ->
    @get_collection (error, collection) ->
      return callback(error) if error?

      collection.find(query).toArray (error, results) ->
        callback(error, results)

  @create: (item, callback) ->
    @get_collection (error, collection) =>
      return callback(error) if error?
      hook(item) for hook in @before_save

      collection.insert item, (error, updated_collection) ->
        callback(null, updated_collection[0])

  @destroy_all: ->
    # TODO:

  save: ->
    # TODO:

  destroy: ->
    # TOOD:

MongoTimestamps = ->
  @before_save.push (item) ->
    item.created_at = new Date()

exports.MongoDocument = MongoDocument
exports.MongoTimestamps = MongoTimestamps
exports.include = include
