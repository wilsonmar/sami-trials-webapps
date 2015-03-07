React = require("react")
Router = require("react-router")
{Link} = Router

module.exports = (context) ->
  {userId, api} = context

  TrialMixin = require("../components/trial_mixin")(context)
  TrialSidebar = require("../components/trial_sidebar")
  TrialExport = require("../components/trial_export")(context)

  React.createClass
    mixins: [TrialMixin]
    getInitialState: ->
      exported: []
      retrieved: false

    componentWillMount: ->
      id = @props.params.id
      exported = api.Trial(id).exports(@onResponse)
      @plug(exported, "exported")

    onResponse: ->
      @setState retrieved: true

    render: ->
      <div className="paneled">
        <TrialSidebar className="left-panel" trial={@state.trial} admins={@state.admins} devices={@state.deviceTypes} totalParticipants={@state.totalParticipants} />
        <iframe name='downloadExportFrame' id='downloadExportFrame' style={display:"none"}></iframe>
        <h1 className="panel-title">Your Exported Data</h1>
        {@exportHistory @state.exported || []}
      </div>

    exportHistory: (exports) ->
      <div className="export-history">
        {exports.map (exported) =>
          <TrialExport data={exported} />
        }
        {if @state.retrieved and exports.length == 0
          [ <p className="empty">You have no data exports available for download.</p>
          <Link className="new-export-link" to="exportTrial" params={{id: @props.params.id}}>Create new &raquo;</Link> ]
        }
      </div>
