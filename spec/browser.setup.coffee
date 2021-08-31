{ chromium } = require 'playwright'

OpenPage = ->
  browser = await chromium.launch()
  page = await browser.newPage()
  await page.goto 'http://localhost:8080'
  page

module.exports = { OpenPage }
