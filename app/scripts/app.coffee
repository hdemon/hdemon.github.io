Vue = require 'vue'
Articles = require './models/articles'


window.app = {}

app.rootVm = new Vue
  el: "#app"
  components:
    articleIndex: require "./components/article-index/index.coffee"
    articleBody: require "./components/article-body/index.coffee"
  template: require "./app.html"
  data:
    articles: []
  methods:
    showArticle: ->

  created: ->
    app.articles = new Articles @$data.articles
    app.articles.fetch()
