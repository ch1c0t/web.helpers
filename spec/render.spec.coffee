{ StartServer, StopServer } = require './server.setup.coffee'
{ OpenPage } = require './browser.setup.coffee'

describe 'render', ->
  beforeAll ->
    @server = await StartServer()
    @page = await OpenPage()

  it 'accepts a single HTMLElement instance', ->
    one = await @page.$ '#One'
    text = await one.evaluate (el) -> el.textContent
    expect(text).toEqual 'A single element.'

  it 'accepts an Array of HTMLElement instances', ->
    first = await @page.$ '#Many :first-child'
    text = await first.evaluate (el) -> el.textContent
    expect(text).toEqual 'First'

    last = await @page.$ '#Many :last-child'
    text2 = await last.evaluate (el) -> el.textContent
    expect(text2).toEqual 'Second'

  afterAll ->
    await StopServer @server
    await @page.close()
