require('insert-css')(require('./style.styl'))

Articles = require '../../models/articles'
Article = require '../../models/article'


module.exports =
  className: 'article-index'
  components:
    articleBody: require "../../components/article-body/index.coffee"
  template: require './template.html'
  data:
    articles: []
  methods:
    fetchArticleBody: (article) ->
      article = new Article @$data.articles[article.id]
      article.fetch()

    fetchArticleIndex: ->
      articles = new Articles @$data.articles
      articles.fetch()

  created: ->
    @fetchArticleIndex()
