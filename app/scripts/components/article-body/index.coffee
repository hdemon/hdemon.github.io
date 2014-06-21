require('insert-css')(require('./style.styl'))

module.exports =
  id: 'article-body'
  template: require('./template.html')
  data:
    title: ""
    published: ""
    body: ""
    isHidden: true
  created: ->
    @$on 'fetchedArticleBody', (articleId) =>
      entry = app.articles.entries[articleId]
      {title, body, published} = entry
      @$data = {title, body, published}
