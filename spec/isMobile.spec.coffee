{ StartServer, StopServer } = require './server.setup.coffee'
{ OpenPage } = require './browser.setup.coffee'
{ devices, chromium } = require 'playwright'

NewPage = ({ device }) ->
  browser = await chromium.launch
    args: ['--start-maximized', '--window-size=1920,1080']
    defaultViewport: null
  context = await browser.newContext { ...devices[device] }

  page = await context.newPage()
  await page.goto 'http://localhost:8080'
  page

describe 'isMobile', ->
  beforeAll ->
    @server = await StartServer()

  it 'renders a mobile version', ->
    @page = await NewPage { 'Pixel 5' }

    element = await @page.$ '#DesktopOrMobile'
    text = await element.innerText()
    expect(text).toEqual 'Mobile version'

  # https://github.com/microsoft/playwright/issues/1086#issuecomment-592227413
  # How to get a headless page with an appropriate viewport?
  xit 'renders a desktop version', ->
    @page = await NewPage { 'Desktop Chrome' }

    element = await @page.$ '#DesktopOrMobile'
    text = await element.innerText()
    expect(text).toEqual 'Desktop version'

  afterEach ->
    await @page.close()

  afterAll ->
    await StopServer @server
