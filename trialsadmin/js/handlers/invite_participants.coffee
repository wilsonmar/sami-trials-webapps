React = require("react")
Router = require("react-router")
Bacon = require("baconjs")
merge = require("../../common-js/util/merge")
{Navigation} = Router

InviteParticipantsForm = require("../components/invite_participants_form")()

module.exports = (context) ->
  {api} = context
  TrialMixin = require("../components/trial_mixin")(context)

  React.createClass
    mixins: [TrialMixin, Navigation]
    getInitialState: ->  {}

    onSubmit: ({invitations}) ->
      id = @props.params.id
      Bacon.combineAsArray(invitations.map (invitation) =>
        api.Trial(id).createInvite(merge(invitation, invitationParticipantAcceptUrl: context.invitationParticipantAcceptUrl, invitationAdminAcceptUrl: context.invitationAdminAcceptUrl))
      ).onValue =>
        @transitionTo("trial", {id})

    render: ->
      <div className="paneled">
        <div className="left-panel">
          <h1 className="small-panel-title">Invite More People</h1>
          {if (trial = @state.trial)?
            <h2 className="panel-title edit-trial">{trial.name}</h2>
          }
        </div>
        <div className="participants">
          {@toggleButton()}
          <InviteParticipantsForm onSubmit={@onSubmit} />
        </div>
      </div>
