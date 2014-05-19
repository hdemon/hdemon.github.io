fs = require 'fs'
_ = require 'underscore'

fs.readdir './articles', (err, files) ->
  mdFiles = _.map (_.filter files, (name) -> name.match(/\.markdown$/)), (fileName) -> fileName.replace /\.markdown$/, ''
  fs.writeFile './articles/index.json', JSON.stringify(mdFiles), (err) -> console.log err
