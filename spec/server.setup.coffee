{ spawn } = require 'child_process'

StartServer = ->
  server = spawn './node_modules/.bin/coffee', ['spec/server.coffee']
  server.stderr.pipe process.stderr
  new Promise (resolve) ->
    server.stdout.on 'data', (data) ->
      if data.toString().startsWith 'The server is listening'
        resolve server

StopServer = (server) ->
  process.kill server.pid

  new Promise (resolve) ->
    server.on 'close', ->
      resolve()

module.exports = { StartServer, StopServer }
