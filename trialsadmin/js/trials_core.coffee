React = require("react")
Router = require("react-router")
{Routes, Route, DefaultRoute, Link} = Router

module.exports = (args) -> (config) ->
  context = require("../common-js/util/context")(config)
  context.invitationParticipantAcceptUrl = args.invitationParticipantAcceptUrl
  context.invitationAdminAcceptUrl = args.invitationAdminAcceptUrl

  App = require("./handlers/trials_app")(context)
  Index = require("./handlers/trial_index")(context)
  NewTrial = require("./handlers/new_trial")(context)
  EditTrial = require("./handlers/edit_trial")(context)
  TrialDetail = require("./handlers/trial_detail")(context)
  TrialExports = require("./handlers/trial_exports")(context)
  ExportTrial = require("./handlers/export_trial")(context)
  InviteParticipants = require("./handlers/invite_participants")(context)
  InactiveParticipants = require("./handlers/inactive_participants")(context)
  AcceptInvite = require("../common-js/handlers/accept_invite")(context, true)
  ViewData = require("./handlers/trial_data")(context)

  <Route name="app" path="/" handler={App}>
    <DefaultRoute name="index" handler={Index} />
    <Route name="newTrial" handler={NewTrial}/>
    <Route name="editTrial" path="/editTrial/:id" handler={EditTrial}/>
    <Route name="trial" path="/trial/:id" handler={TrialDetail}/>
    <Route name="trialExports" path="/trial/:id/exports" handler={TrialExports}/>
    <Route name="exportTrial" path="/exportTrial/:id" handler={ExportTrial}/>
    <Route name="reExportTrial" path="/exportTrial/:id/:pastExportRequest" handler={ExportTrial}/>
    <Route name="inactiveParticipants" path="/trial/:id/inactive" handler={InactiveParticipants}/>
    <Route name="inviteParticipants" path="/trial/:id/invite" handler={InviteParticipants}/>
    <Route name="acceptInvite" path="/trial/:id/accept/:iid" handler={AcceptInvite}/>
    <Route name="viewData" path="/trial/:id/data/:uid" handler={ViewData}/>
    <Route name="viewMessages" path="/trial/:id/messages/:uid" handler={ViewData}/>
  </Route>
