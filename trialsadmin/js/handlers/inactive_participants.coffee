React = require("react")
Router = require("react-router")
Bacon = require("baconjs")
{BaconMixin} = require("react-bacon")
Moment = require("moment")

module.exports = (context) ->
  {api} = context
  TrialMixin = require("../components/trial_mixin")(context)
  TrialSidebar = require("../components/trial_sidebar")

  React.createClass
    mixins: [TrialMixin]
    getInitialState: ->  {}

    deleteInvite: (invite) ->
      api.Trial(invite.tid).Invite(invite.id).delete

    sendInvite: (trialId, invite) ->
      api.Trial(trialId).createInvite(invite)

    revoke: (invite, andResend = false) ->
      @deleteInvite(invite).onValue (v) =>
        @setState(
          invitations:
            @state.invitations.filter (i) -> i != invite
        )
        if andResend
          @sendInvite(
            invite.tid,
            email: invite.email
            invitationType: invite.invitationType
            invitationParticipantAcceptUrl: context.invitationParticipantAcceptUrl
            invitationAdminAcceptUrl: context.invitationAdminAcceptUrl
          ).onValue (v) =>
              if newInvite = v.data
                invitations = @state.invitations
                invitations.splice(0, 0, newInvite)
                @setState(invitations: invitations)

    render: ->
      <div className="paneled">
        <TrialSidebar className="left-panel" trial={@state.trial} admins={@state.admins} devices={@state.deviceTypes} totalParticipants={@state.totalParticipants} />
        <div className="participants-inactive">
          {@toggleButton()}
          <h2 className="medium-header">Have not signed up</h2>
          {@invites(@state.invites || [])}
        </div>
      </div>

    invites: (invites) ->
      <table id="inactive-participants-table" className="participants-table">
        <thead>
          <tr>
            <th>EMAIL</th>
            <th>INVITED</th>
            <th>OPTIONS</th>
          </tr>
        </thead>
        <tbody>
          {(@state?.invitations || []).map (invite) =>
            <tr key={invite.id}>
              <td className="participant-email">
                <a href="#">{invite.email}</a></td>
              <td className="participant-invited">{Moment(invite.sentDate).format('MMMM D')}</td>
              <td className="participant-options">
                {if invite.expired
                  <span className="disabled">INVITE EXPIRED</span>
                }
                <span onClick={=> @revoke(invite, true)} className="send">RE-SEND INVITE</span>
                {unless invite.expired
                  <span onClick={=> @revoke(invite)} className="revoke">REVOKE INVITE</span>
                }
              </td>
            </tr>}
        </tbody>
      </table>
