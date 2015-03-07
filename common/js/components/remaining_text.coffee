React = require("react")
{BaconMixin} = require("react-bacon")


module.exports = ({values, maxLengths}) ->
  React.createClass
    getInitialState: -> {}
    mixins: [BaconMixin]
    render: ->
      <div className="remaining-text">
        {@props.children}
        <span>{@state.remaining}</span>
      </div>
    componentWillMount: ->
      name = @props.for
      if (maxLength = maxLengths[name])?
        remaining = values.map (values) ->
          maxLength - (values.get(name) || "").length
        @plug(remaining, "remaining")



