React = require("react")
Router = require("react-router")
{BaconMixin} = require("react-bacon")
merge = require("../../common-js/util/merge")
Bacon = require("baconjs")
{Navigation} = Router

module.exports = (context) ->
  {api} = context
  TrialForm = require("../components/trial_form")(context)

  React.createClass
    mixins: [BaconMixin, Navigation]
    render: ->
      <div className="paneled">
        <div className="left-panel">
          <h1 className="panel-title new-trial">Create a New Trial</h1>
        </div>
        <div className="main-panel">
          <TrialForm onSubmit={@submit} />
        </div>
      </div>

    submit: (data) ->
      invitations = (data.participants || []).concat(data.administrators || [])

      api.createTrial(data).flatMap ({error, data}) =>
        if data
          {id} = data
          Bacon.combineAsArray(invitations.map (invitation) =>
            api.Trial(id).createInvite(merge(invitation, invitationParticipantAcceptUrl: context.invitationParticipantAcceptUrl, invitationAdminAcceptUrl: context.invitationAdminAcceptUrl))
          ).map =>
            {success: => @transitionTo("index")}
        else
          {errors} = error
          Bacon.once({errors})
