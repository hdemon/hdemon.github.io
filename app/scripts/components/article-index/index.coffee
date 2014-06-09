require('insert-css')(require('./style.styl'))
_ = require 'underscore'
request = require 'superagent'
marked = require 'marked'

marked.setOptions
  highlight: (code) ->
    require('highlight.js').highlightAuto(code).value


class Article
  constructor: (@$article) ->

  hasFetched: ->
    @$article.body?

  fetch: ->
    return if @hasFetched()
    new Promise (resolve, reject) =>
      request.get "/articles/#{@$article.title}.markdown", (res) =>
        resolve @$article.body = marked res.text


module.exports =
  className: 'article-index'
  template: require './template.html'
  methods:
    showArticle: ->
      @fetchArticle()

    fetchArticle: ->
      new Article(@$data).fetch()
