Db = require('mongodb').Db
Connection = require('mongodb').Connection
Server = require('mongodb').Server
BSON = require('mongodb').BSON
ObjectID = require('mongodb').ObjectID


"""
client = new Db('test', new Server("127.0.0.1", 27017, {}))

test = (err, collection) -> 
      collection.insert {a:2}, (err, docs) ->
        collection.count (err, count) ->
          console.log(count)

        collection.find().toArray (err, results) ->
          console.log(results)

          client.close()

client.open (err, p_client) ->
  client.collection('test_insert', test)
"""

class MongoDocument
  @connection: new Db("test", new Server("127.0.0.1", 27017, {}))
  @buffer: []
  @ready: false

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

  @create: (item, callback) ->
    @get_collection (error, collection) ->
      return callback(error) if error?

      collection.insert item, (error, updated_collection) ->
        callback(null, updated_collection[0])


include = (mixin) ->
  for key, val of mixin
    this[key] = val if mixin.hasOwnProperty(key)


class Test
  @collection = "test_insert"
  include.apply(this, [MongoDocument])
  

Test.create { email: "foooooo" }, (error, tests) ->
  console.log(tests)


Test.all (error, results) ->
  console.log(results)
