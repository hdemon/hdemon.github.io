require('insert-css')(require('./style.styl'))

module.exports =
  id: 'article-body'
  template: require('./template.html')
  methods:
    fetchBody: ->
      console.log @$parent
      article = new Article
