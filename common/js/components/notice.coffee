React = require("react")
{BaconMixin} = require("react-bacon")

module.exports = (noticeBus) ->
  React.createClass
    mixins: [BaconMixin]
    getInitialState: ->
      open: true
      style: 'success'
    hide: ->
      @setState(message: undefined)
    render: ->
      open = @state.message?
      classes = "notice #{@state.style}"
      <div data-open={open} className={classes}>
        {if typeof @state.message == "object"
           @state.message.props.children
         else
           @state.message}
        <div className="close" onClick={@hide}></div>
      </div>

    componentWillMount: ->
      @plug(noticeBus)

    componentDidUpdate: (prevProps, prevState)->
      setTimeout (=> @state.message = undefined ), 500 unless prevState.message == @state.message or @state.message == undefined

