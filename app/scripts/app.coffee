Vue = require 'vue'
Github = require 'github-api'
Promise = require 'bluebird'

class Articles
  username: 'hdemon'
  repository: 'my-site'
  path: 'articles'

  fetch: ->
    github = new Github @username
    @repo = github.getRepo @username, @repository

    def = Promise.defer()
    @fetchContents().then =>
      @readArticles().then -> def.resolve()
    def.promise

  fetchContents: ->
    def = Promise.defer()
    @repo.contents 'master', '/', (err, data) -> def.resolve data
    # @repo.contents 'master', @path, (err, data) -> def.resolve data
    def.promise

  readArticles: ->
    def = Promise.defer()
    @repo.read 'master', 'README.md', (err, data) -> def.resolve data
    def.promise


app = new Vue
  el: "#app"
  components:
    article: require("./components/article/index.coffee")
  template: require("./app.html")
  data:
    articles: []
  methods:
    fetchArticles: ->
      new Articles().fetch().then (articles) => @$data.articles = articles


app.fetchArticles()
