base = require('base-converter')

powers = [
  1,
  10,
  100,
  1000,
  10000,
  100000,
  1000000
]

random = -> Math.floor(Math.random() * 10)

exports.random_encode = () ->
  sum = 0
  for i in powers
    sum += random() * i

  base.decTo62(sum)


exports.decode = (string) ->
  base._62ToDec(string)
