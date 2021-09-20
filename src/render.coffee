render = (id, view) ->
  node = document.getElementById id

  if Array.isArray view
    node.replaceChildren ...view
  else
    node.replaceChildren view

export { render }
