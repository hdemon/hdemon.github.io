Vue = require 'vue'

@app = {}

@app.rootVm = new Vue
  el: "#app"
  components:
    articleIndex: require "./components/article-index/index.coffee"
  template: require "./app.html"
