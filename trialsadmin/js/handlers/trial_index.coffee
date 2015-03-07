React = require("react")
Router = require("react-router")
Moment = require("moment")
Bacon = require("baconjs")
{Link} = Router
{BaconMixin} = require("react-bacon")
merge = require("../../common-js/util/merge")

module.exports = ({userId, api}) ->
  React.createClass
    mixins: [BaconMixin]
    getInitialState: -> {}
    render: ->
      <div className="trial-index">
        <div className="subheader">
          <ul className="stats">
            <li>
              <span id="active-trials" className="stat-number">{@state.trialsCount}</span>
              <span className="stat-label">Active Trials</span>
            </li>
            <li>
              <span id="active-participants" className="stat-number">{@state.totalParticipants}</span>
              <span className="stat-label">Active Participants</span>
            </li>
          </ul>
          <Link id="new-trial-button" to="newTrial" className="button">+ new trial</Link>
        </div>
        <div className="trial-list">
          <ul>
            {(@state?.trials || []).sort((a,b)-> b.startDate - a.startDate).map (trial) ->
              <li key={trial.id}>
                <div className="trial-content">
                  <div className="name"><Link to="trial" params={id: trial.id}>{trial.name}</Link></div>
                  <div className="description">
                    {Moment(trial.startDate).format('MMMM D')}
                    -
                    {if trial.endDate then Moment(trial.endDate).format('MMMM D') else 'Present'}
                  </div>
                </div>
                <ul className="trial-footer">
                  <li className="trial-users">{trial.participantsPage?.total}</li>
                  <li className="trial-admin">{trial.admins?.length}</li>
                  <li className="trial-devices">{trial.devices?.length}</li>
                </ul>
              </li>
            }
          </ul>
        </div>
      </div>

    componentWillMount: ->
      paginateAllTrials = (r) ->
        userId.flatMapLatest (userId) ->
          if r.count + r.offset < r.total
            api.User(userId).TrialsPage(
              role: 'administrator'
              count: 100
              offset: r.count + r.offset
            ).flatMapLatest (page)->
              page.data.trials = page.data.trials.concat(r.data.trials)
              paginateAllTrials(page)
          else
            r

      pages = userId.flatMapLatest (userId) ->
        api.User(userId).TrialsPage(
          role: 'administrator'
          count: 100
          offset: 0
        ).flatMapLatest paginateAllTrials

      trialsCount = pages.flatMapLatest (pages) ->
        pages.total
      .toProperty()

      justTrials = pages.flatMapLatest (pages) ->
        pages.data.trials

      trials = justTrials.flatMapLatest (trials) =>
        Bacon.combineAsArray(trials.map (trial) =>
          apiTrial = api.Trial(trial.id)
          Bacon.combineTemplate(
            admins: apiTrial.admins
            participantsPage: apiTrial.participantsPage(1, 0)
            devices: apiTrial.devices
          ).map (extra) -> merge(trial, extra)
        )
      .toProperty()

      totalParticipants = trials.map (trials) ->
        trials.map (trial) -> trial.participantsPage.total
          .reduce(((a,b) -> a + b), 0)

      @plug(trials, "trials")
      @plug(totalParticipants, "totalParticipants")
      @plug(trialsCount, "trialsCount")
