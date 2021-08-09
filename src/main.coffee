render = (id, object) ->
  node = document.getElementById id

  if Array.isArray object
    node.replaceChildren ...object
  else
    node.replaceChildren object

module.exports = { render }
