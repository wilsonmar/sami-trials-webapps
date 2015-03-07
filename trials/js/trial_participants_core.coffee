React = require("react")
Router = require("react-router")
{Routes, Route, DefaultRoute, Link} = Router
{Routes, Route, DefaultRoute, Link} = Router


module.exports = (config) ->
  context = require("../common-js/util/context")(config)

  App = require("./handlers/trial_participants_app")(context)
  Index = require("./handlers/trial_participants_index")(context)
  Detail = require("./handlers/trial_participant_detail")(context)
  AcceptInvite = require("../common-js/handlers/accept_invite")(context)
  ViewData = require("./handlers/trial_participant_data")(context)

  <Route name="app" path="/" handler={App}>
    <DefaultRoute name="index" handler={Index} />
    <Route name="trial" path="/trial/:id" handler={Detail}/>
    <Route name="acceptInvite" path="/trial/:id/accept/:iid" handler={AcceptInvite}/>
    <Route name="viewData" path="/trial/:id/data" handler={ViewData}/>
    <Route name="viewMessages" path="/trial/:id/messages" handler={ViewData}/>
  </Route>
