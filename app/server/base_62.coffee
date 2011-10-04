base = require('base-converter')


exports.random_encode = () ->
  # 7 digit random
  num = Math.floor(Math.random() * 10000000 + 1)
  base.decTo62(num)


exports.decode = (string) ->
  base._62ToDec(string)
