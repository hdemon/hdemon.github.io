require('insert-css')(require('./style.styl'))


module.exports =
  id: 'article-index'
  template: require './template.html'
  data:
    index: []
  methods:
    showArticleBody: (article) ->
      @$dispatch 'clickedArticleIndex', article.id

  created: ->
    app.articles.fetch().then =>
      @$data.index = app.articles.index
