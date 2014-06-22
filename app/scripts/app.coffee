Vue = require 'vue'
Router = require('director').Router
Articles = require './models/articles'
Vue.use require 'vue-touch'
# Vue.config 'debug', true

window.location.hash = "#/"

window.app = {}
app.rootVm = new Vue
  el: "#app"
  components:
    header: require "./components/header/index.coffee"
    articleIndex: require "./components/article-index/index.coffee"
    articleBody: require "./components/article-body/index.coffee"
  template: require "./app.html"
  data:
    currentView: 'articleIndex'
  created: ->
    app.articles = new Articles

    routes =
      '/': (id) =>
        @$data.currentView = 'articleIndex'

      '/articles/:id': (id) =>
        @fetchArticleBody id
        @$data.currentView = 'articleBody'

    router = Router routes
    router.init()

    @$on "clickedArticleIndex", (articleId) =>
       window.location.hash = "/articles/#{articleId}"

  methods:
    fetchArticleBody: (articleId) ->
      app.articles.entries[articleId].fetch().then =>
        @$broadcast 'fetchedArticleBody', articleId

    switchScreenToArticle: (articleId) ->
