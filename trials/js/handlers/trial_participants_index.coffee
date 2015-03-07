React = require("react")
Router = require("react-router")
Moment = require("moment")
{BaconMixin} = require("react-bacon")
{Link} = Router

module.exports = (context) ->
  {userId, api} = context

  React.createClass
    mixins: [BaconMixin]
    getInitialState: -> {}
    render: ->
      <div className="trial-participants-index">
        <div className="trial-list">
          <h2>Your Trials</h2>
          <ul>
            {(@state.trials || []).map (trial) ->
              <li key={trial.id}>
                <Link className="trial" to="trial" params={id: trial.id}>
                  <h3 className="trial-title">{trial.name}</h3>
                  <div className="trial-date">{[
                      Moment(trial.startDate).format('MMMM D').toUpperCase(),
                      <span>&#8212;</span>,
                      if trial.endDate then Moment(trial.endDate).format('MMMM D').toUpperCase() else 'now'
                    ]}</div>
                  <div className="trial-description">{trial.description}</div>
                </Link>
              </li>
            }
          </ul>
        </div>
      </div>

    componentWillMount: ->
      trials = userId.flatMap (userId) =>
        api.User(userId).trials('participant')
      .toProperty()

      @plug(trials, "trials")
