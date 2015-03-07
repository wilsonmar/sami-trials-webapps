React = require("react")
Router = require("react-router")
Moment = require("moment")
{Link} = Router

module.exports =
  React.createClass
    getDefaultProps: ->
      totalParticipants: 0
    render: ->
      <div className={@props.className}>
        {if (trial = @props.trial)?
          <div>
            <h1 className="panel-title">{trial.name}</h1>
            <div className="trial-meta">
              <div className="trial-date">{Moment(trial.startDate).format('MMMM D')} - {if trial.endDate then Moment(trial.endDate).format('MMMM D') else 'Present'}</div>
              <Link className="edit-trial-link" to="editTrial" params={{id: trial.id}}>Edit Trial...</Link>
            </div>
            <div className="description">{trial.description}</div>
          </div>
        }
        {if (admins = @props.admins)?
          <div className="admins">
            <h3>Admins:</h3>
            <ul>
              {admins.map (admin) ->
                <li key={admin.id} className="name">
                  {admin.fullName}
                </li>
              }
            </ul>
          </div>
        }

        {if (deviceTypes = @props.devices)?
          <div className="devices">
            <h3>Devices:</h3>
            <ul>
              {deviceTypes.map (deviceType) ->
                <li key={deviceType.id} className="name">
                  {deviceType.name}
                </li>
              }
              {<li>No devices added yet</li> if deviceTypes.length is 0}
            </ul>
          </div>
        }

        {if (trial = @props.trial)? and @props.totalParticipants > 0
          <div className="export-links">
            <h3>Exports:</h3>
            <ul>
              <li>
                <Link className="view-exports-link" to="trialExports" params={{id: trial.id}}>View exports &raquo;</Link>
              </li>
              <li>
                <Link className="new-export-link" to="exportTrial" params={{id: trial.id}}>Create new &raquo;</Link>
              </li>
            </ul>
          </div>
        }
      </div>
