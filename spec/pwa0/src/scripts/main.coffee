import { render, isMobile } from 'web.helpers'

window.Init = ->
  p = document.createElement 'p'
  p.textContent = 'A single element.'
  render 'One', p

  first = document.createElement 'p'
  first.textContent = 'First'
  second = document.createElement 'p'
  second.textContent = 'Second'
  render 'Many', [first, second]

  if isMobile()
    p = document.createElement 'p'
    p.textContent = 'Mobile version'
    render 'DesktopOrMobile', p
  else
    p = document.createElement 'p'
    p.textContent = 'Desktop version'
    render 'DesktopOrMobile', p
