serve = require 'serve-handler'
http = require 'http'

server = http.createServer (request, response) ->
  serve request, response,
    public: 'spec/pwa0/dist.dev'

server.listen 8080, ->
  console.log 'The server is listening.'
