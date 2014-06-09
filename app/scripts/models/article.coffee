Base = require './base'

module.exports = class Article extends Base
  fetch: ->
    return if @hasFetched()
    new Promise (resolve, reject) =>
      request.get "/articles/#{@$article.title}.markdown", (res) =>
        resolve @$article.body = marked res.text

  hasFetched: ->
    @$article.body?
