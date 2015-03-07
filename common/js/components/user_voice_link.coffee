React = require("react/addons")
{ReactScriptLoaderMixin} = require('react-script-loader')

module.exports = React.createClass(
  mixins: [ReactScriptLoaderMixin]
  getScriptURL: ->
    "//widget.uservoice.com/YaRJZVwKZbDRi0iWxAa9A.js"

  getInitialState: ->
    scriptLoading: true
    scriptLoadError: false

  onScriptLoaded: ->
    @setState scriptLoading: false
    UserVoice?.push(['addTrigger', '#feedback', { mode: 'contact' }])
    return

  onScriptError: ->
    @setState
      scriptLoading: false
      scriptLoadError: true
    return

  render: ->
    if (!@state.scriptLoading and !@state.ScriptLoadError)?
      <a className="feedback-link" id="feedback" href="#">Feedback</a>
)
