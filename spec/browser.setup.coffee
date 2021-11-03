puppeteer = require 'puppeteer'

OpenPage = (params) ->
  browser = await puppeteer.launch headless: no
  page = await browser.newPage()

  device = params?.device
  if device?
    await page.emulate puppeteer.devices[device]

  await page.goto 'http://localhost:8080'
  page

module.exports = { OpenPage }
