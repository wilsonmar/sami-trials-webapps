React = require("react")
Router = require("react-router")
Bacon = require("baconjs")
{Link} = Router
{BaconMixin} = require("react-bacon")
merge = require("../../common-js/util/merge")

module.exports = ({api}) ->
  mixins: [BaconMixin]
  toggleButton: ->
    activeCount = (@state?.totalParticipants || 0)
    inactiveCount = (@state?.invitations || []).length
    <div className="participants-toggle">
      <Link id="active-participants-button" to="trial" params={id: @props.params.id} className="participants-button">
        <i className="icon-users"></i> {activeCount} ACTIVE PARTICIPANTS
      </Link>
      <Link id="inactive-participants-button" to="inactiveParticipants" params={id: @props.params.id} className="participants-button">
        <i className="icon-inactive-user"></i> {inactiveCount} INACTIVE PARTICIPANTS
      </Link>
      <Link id="invite-participants-button" to="inviteParticipants" params={id: @props.params.id} className="participants-button no-icon">
        INVITE MORE
      </Link>
    </div>

  componentWillMount: ->
    id = @props.params.id
    apiTrial = api.Trial(id)

    sentInvitations = apiTrial.invitations('sent')
      .map (invitations) ->
        invitations.map (i) -> merge(i, expired: false)

    expiredInvitations = apiTrial.invitations('expired')
      .map (invitations) ->
        invitations.map (i) -> merge(i, expired: true)

    invitations = Bacon.combineTemplate({
      sentInvitations,
      expiredInvitations
    }).map ({sentInvitations, expiredInvitations}) ->
      sentInvitations.concat(expiredInvitations)

    @plug(invitations, "invitations")

    @plug(apiTrial.fetch, "trial")
    @plug(apiTrial.admins, "admins")
    @plug(apiTrial.deviceTypes, "deviceTypes")

    totalParticipants = apiTrial.participantsPage(1, 0)
      .map (page) -> page.total
    @plug(totalParticipants, "totalParticipants")
