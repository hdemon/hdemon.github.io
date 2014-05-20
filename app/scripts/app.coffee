_ = require 'underscore'
Vue = require 'vue'
Promise = require 'bluebird'
request = require 'superagent'


class Articles
  constructor: (@$articles) ->

  fetchIndex: ->
    new Promise (resolve, reject) =>
      request.get "/articles/index.json", (res) =>
        titles = JSON.parse res.text
        _.each titles, (title, indexNum) => @$articles.push {id: indexNum, title: title, body: null}
        resolve @$articles


window.app = {}

app.rootVm = new Vue
  el: "#app"
  components:
    articleIndex: require "./components/article-index/index.coffee"
  template: require "./app.html"
  data:
    articles: []
  created: ->
    app.articles = new Articles @$data.articles
    app.articles.fetchIndex()
