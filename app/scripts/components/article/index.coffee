require('insert-css')(require('./style.styl'))
request = require 'superagent'
_ = require 'underscore'


class Article
  constructor: (@$article) ->

  hasFetched: ->
    @$article.body?

  fetch: ->
    return if @hasFetched()
    new Promise (resolve, reject) =>
      request.get "/articles/#{@$article.title}.markdown", (res) =>
        resolve @$article.body = res.text


module.exports =
  className: 'article-index'
  template: require './template.html'
  methods:
    renderArticle: ->
      @fetchArticle()

    fetchArticle: ->
      new Article(@$parent.$data).fetch()
