request = require 'superagent'
marked = require 'marked'
Base = require './base'

marked.setOptions
  highlight: (code) ->
    require('highlight.js').highlightAuto(code).value


module.exports = class Article
  constructor: (@params) ->
    @id = params.id
    @title = params.title
    @published = params.published
    @body = null

  fetch: ->
    return (new Promise (resolve) => resolve()) if @hasFetched()
    new Promise (resolve, reject) =>
      request.get "/articles/#{@title}.markdown", (res) =>
        @body = marked res.text
        resolve {id: @id, title: @title, published: @published, body: @body}

  hasFetched: ->
    @body?
