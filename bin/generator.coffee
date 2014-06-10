fs = require 'fs'
_ = require 'underscore'
moment = require 'moment'

fs.readdir './articles', (err, files) ->
  mdFiles = _.map (_.filter files, (name) -> name.match(/\.markdown$/)), (fileName, index) ->
    id: index
    published: moment(fs.statSync('./articles/' + fileName).atime.toISOString()).format('YYYY-MM-DD')
    title: fileName.replace /\.markdown$/, ''

  fs.writeFile './articles/index.json', JSON.stringify(mdFiles), (err) -> console.log err
