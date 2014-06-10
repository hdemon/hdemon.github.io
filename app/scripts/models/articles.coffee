_ = require 'lodash'
Promise = require 'bluebird'
request = require 'superagent'

Base = require './base'
Article = require './article'

module.exports = class Articles extends Base
  fetch: ->
    new Promise (resolve, reject) =>
      request.get "/articles/index.json", (res) =>
        titles = JSON.parse res.text
        _.each titles, (title, indexNum) =>
          @values.push new Article({id: indexNum, title: title, body: null}).values
        resolve @values
