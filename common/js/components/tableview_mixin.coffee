Router = require("react-router")
{Navigation} = Router

module.exports =
    componentDidMount: ->
      #console.log "didMount"
      window.addEventListener "message", @handleIframeTableView
    componentWillUnmount: ->
      #console.log "did unmount"
      window.removeEventListener "message" , @handleIframeTableView
    handleIframeTableView: (e)->
      message = e.data
      if message != "data" and message != "messages"
        return
      find = if e.data == "messages" then "data" else "messages"
      hash = Router.HashLocation.getCurrentPath()
      newHash = hash.replace(find, e.data)
      this.replaceWith(newHash)