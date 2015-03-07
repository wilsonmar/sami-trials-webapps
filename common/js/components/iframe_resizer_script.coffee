React = require("react/addons")
{ReactScriptLoaderMixin} = require('react-script-loader')

module.exports = React.createClass(
  mixins: [ReactScriptLoaderMixin]
  getScriptURL: -> "/assets/javascripts/tools/iframeResizer.min.js"
  onScriptLoaded: -> return
  onScriptError: -> return
  render: -> null
)
