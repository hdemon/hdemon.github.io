_ = require 'underscore'
Vue = require 'vue'
Promise = require 'bluebird'
request = require 'superagent'


class Articles
  constructor: (@$data) ->

  fetch: ->
    @fetchIndex().then (index) => @readArticles(index)

  fetchIndex: ->
    new Promise (resolve, reject) =>
      request.get "/articles/index.json", (res) ->
        resolve JSON.parse res.text

  readArticles: (index) ->
    _.each index, (fileName) =>
      request.get "/articles/#{fileName}", (res) =>
        @$data.articles.push {title: fileName, body: res}


app = new Vue
  el: "#app"
  components:
    article: require("./components/article/index.coffee")
  template: require("./app.html")
  data:
    articles: []
  methods:
    fetchArticles: -> new Articles(@$data).fetch()


app.fetchArticles()
