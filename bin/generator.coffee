fs = require 'fs'
_ = require 'underscore'

fs.readdir './articles', (err, files) ->
  mdFiles = JSON.stringify _.filter files, (name) -> name.match /\.markdown$/
  fs.writeFile './articles/index.json', mdFiles, (err) -> console.log err
