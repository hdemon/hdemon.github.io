Vue = require 'vue'
Articles = require './models/articles'
Vue.use require 'vue-touch'

@app = {}

@app.rootVm = new Vue
  el: "#app"
  components:
    articleIndex: require "./components/article-index/index.coffee"
    articleBody: require "./components/article-body/index.coffee"
  template: require "./app.html"
  created: ->
    app.articles = new Articles

    @$on "clickedArticleIndex", (articleId) =>
      @$broadcast 'clickedArticleBody', articleId
      @fetchArticleBody articleId
      @switchScreenToArticle articleId

  methods:
    fetchArticleBody: (articleId) ->
      app.articles.entries[articleId].fetch().then =>
        @$broadcast 'fetchedArticleBody', articleId

    switchScreenToArticle: (articleId) ->
