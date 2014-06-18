_ = require 'lodash'
Promise = require 'bluebird'
request = require 'superagent'

Article = require './article'

module.exports = class Articles
  constructor: ->
    @entries = []
    @index = []

  fetch: =>
    new Promise (resolve, reject) =>
      request.get "/articles/index.json", (res) =>
        metaInfoArray = JSON.parse res.text
        _.each metaInfoArray, (metaInfo, indexNum) =>
          {id, title, body, published} = metaInfo
          @entries.push new Article({id, title, body, published})
          @index.push {id, title, published}
        resolve @entries
