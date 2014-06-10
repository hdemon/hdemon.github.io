request = require 'superagent'
marked = require 'marked'
Base = require './base'

marked.setOptions
  highlight: (code) ->
    require('highlight.js').highlightAuto(code).value


module.exports = class Article extends Base
  fetch: ->
    return if @hasFetched()
    new Promise (resolve, reject) =>
      request.get "/articles/#{@values.title}.markdown", (res) =>
        resolve @values.body = marked res.text

  hasFetched: ->
    @values.body?
