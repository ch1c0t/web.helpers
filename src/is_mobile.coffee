isScreenSmall = ->
  Math.min(window.screen.width, window.screen.height) < 768

isAgentMobile = ->
  (navigator.userAgent.indexOf 'Mobi') > -1

isMobile = ->
  isScreenSmall() or isAgentMobile()

module.exports = isMobile
