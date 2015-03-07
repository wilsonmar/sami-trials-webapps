React = require("react")
Router = require("react-router")
{Navigation} = Router
{BaconMixin} = require("react-bacon")
TableviewMixin = require("../../common-js/components/tableview_mixin")

module.exports = ({simbaUrl, api, accessToken, hideFooterBus}) ->
  BackFrame = require("../../common-js/components/back_frame")(hideFooterBus)

  React.createClass
    mixins: [BaconMixin, Navigation,TableviewMixin]
    getInitialState: -> {}
    
    render: ->
      hash = if Router.HashLocation.getCurrentPath().indexOf("messages") >= 0 then "messages" else "data"
      src = "#{simbaUrl}/data_visualization/#{@props.params.id}##{hash}"
      <BackFrame backUrl={@makeHref('trial', id: @props.params.id)} backText="BACK TO TRIAL" src={src}>
        YOUR “{@state.trial?.name}” TRIAL DATA
      </BackFrame>

    componentWillMount: ->
      @plug(api.Trial(@props.params.id).fetch, "trial")
