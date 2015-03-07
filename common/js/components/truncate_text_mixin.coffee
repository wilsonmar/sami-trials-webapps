React = require("react")

module.exports =
  handleResize: ->
    dt = @refs.truncateTitle.getDOMNode()
    title = dt.getAttribute('title')
    dt.innerHTML = title

    for i in [0..title.length]
      break if dt.clientHeight <= 50
      dt.innerHTML = "#{title.substring(0, title.length - i)}…"

    @setState(truncatedTitle: dt.innerHTML)

  componentDidMount: ->
    @handleResize()
    window.addEventListener('resize', @handleResize)

  componentWillUnmount: ->
    window.removeEventListener('resize', @handleResize)
