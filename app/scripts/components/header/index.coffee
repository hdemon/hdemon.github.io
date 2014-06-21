require('insert-css')(require('./style.styl'))

module.exports =
  id: 'header'
  template: require('./template.html')
  methods:
    transition: (e) ->
      window.location.href = e.target.attributes[0].value
