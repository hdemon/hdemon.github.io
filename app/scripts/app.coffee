Vue = require 'vue'
Articles = require './models/articles'
Vue.use require 'vue-touch'
# Vue.config 'debug', true


@app = {}
@app.rootVm = new Vue
  el: "#app"
  components:
    header: require "./components/header/index.coffee"
    # footer: require "./components/footer/index.coffee"
    articleIndex: require "./components/article-index/index.coffee"
    articleBody: require "./components/article-body/index.coffee"
  template: require "./app.html"
  data:
    currentView: 'articleIndex'
  created: ->
    app.articles = new Articles

    @$on "clickedArticleIndex", (articleId) =>
      @$data.currentView = 'articleBody'
      @fetchArticleBody articleId

  methods:
    fetchArticleBody: (articleId) ->
      app.articles.entries[articleId].fetch().then =>
        @$broadcast 'fetchedArticleBody', articleId

    switchScreenToArticle: (articleId) ->
