{ StartServer, StopServer } = require './server.setup.coffee'
{ OpenPage } = require './browser.setup.coffee'

describe 'isMobile', ->
  beforeAll ->
    @server = await StartServer()

  it 'renders a mobile version', ->
    @page = await OpenPage { device: 'Nexus 5' }

    element = await @page.$ '#DesktopOrMobile'
    text = await element.evaluate (el) -> el.textContent
    expect(text).toEqual 'Mobile version'

  it 'renders a desktop version', ->
    @page = await OpenPage {}

    element = await @page.$ '#DesktopOrMobile'
    text = await element.evaluate (el) -> el.textContent
    expect(text).toEqual 'Desktop version'

  afterEach ->
    await @page.close()

  afterAll ->
    await StopServer @server
