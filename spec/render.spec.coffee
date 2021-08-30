{ StartServer, StopServer } = require './server.setup.coffee'

describe 'render', ->
  beforeAll ->
    @server = await StartServer()

  it 'works', ->
    expect(0).toEqual 0

  it 'works 2', ->
    response = 'some support'
    expect(response).toContain 'support'

  afterAll ->
    await StopServer @server
