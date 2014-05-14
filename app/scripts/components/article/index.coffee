require('insert-css')(require('./style.styl'))

module.exports =
  id: 'article'
  template: require('./template.html')
  methods:
    onClick: ->
      console.log 333
