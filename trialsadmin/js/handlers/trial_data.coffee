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
      src = "#{simbaUrl}/data_visualization/#{@props.params.uid}/#{@props.params.id}##{hash}"
      <BackFrame backUrl={@makeHref('trial', id: @props.params.id)} backText="BACK TO TRIAL" src={src}>
        “{@state.trial?.name}” TRIAL DATA FOR:
        <div className="frame-user">{@state.participant?.fullName}</div>
      </BackFrame>

    componentWillMount: ->
      apiTrial = api.Trial(@props.params.id)
      userId = @props.params.uid

      participant = apiTrial.participantsPage(100, 0).map((page) ->
        page.data.participants.filter (participant)->
          participant.id == userId
      ).map (participants) ->
        return null unless participants?.length > 0
        participants[0]

      @plug(participant, 'participant')
      @plug(apiTrial.fetch, "trial")
