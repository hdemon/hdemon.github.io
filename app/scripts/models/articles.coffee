_ = require 'lodash'
Promise = require 'bluebird'
request = require 'superagent'

Base = require './base'
Article = require './article'

module.exports = class Articles extends Base
  fetch: ->
    new Promise (resolve, reject) =>
      request.get "/articles/index.json", (res) =>
        metaInfoArray = JSON.parse res.text
        _.each metaInfoArray, (metaInfo, indexNum) =>
          {id, title, body, published} = metaInfo
          @values.push new Article({id, title, body, published}).values
        resolve @values
