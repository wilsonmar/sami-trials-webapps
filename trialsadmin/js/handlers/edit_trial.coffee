React = require("react")
{BaconMixin} = require("react-bacon")
Bacon = require("baconjs")
Router = require("react-router")
merge = require("../../common-js/util/merge")
Immutable = require("immutable")
{Navigation} = Router

module.exports = (context) ->
  {api} = context
  TrialForm = require("../components/trial_form")(context)

  React.createClass
    mixins: [BaconMixin, Navigation]
    getInitialState: -> {}
    render: ->
      if (trial = @state.trial)?
        <div className="paneled">
          <div className="left-panel">
            <h1 className="small-panel-title">Edit Trial</h1>
            <h2 className="panel-title edit-trial">{trial.name}</h2>
          </div>
          <TrialForm onSubmit={@submit} trial={trial} />
        </div>
      else
        <div className="paneled"></div>

    componentWillMount: ->
      apiTrial = api.Trial(@props.params.id)
      trialOnly = apiTrial.fetch
      deviceTypes = apiTrial.deviceTypes

      trial = Bacon.combineTemplate({trial: trialOnly, deviceTypes})
        .map ({trial, deviceTypes}) ->
          merge(trial, {deviceTypes})

      @plug(trial, "trial")

    submit: (data) ->
      id = @props.params.id
      previousDeviceTypes = Immutable.Set(@state.trial.deviceTypes...)
      newDeviceTypes = Immutable.Set(data.deviceTypes...)
      deviceTypesToAdd = newDeviceTypes.subtract(previousDeviceTypes).toArray()

      api.Trial(id).update(data).flatMap ({error}) =>
        if error
          {errors} = error
          Bacon.once({errors})
        else
          saveDeviceTypes = Bacon.combineAsArray(deviceTypesToAdd.map (dt) =>
            api.Trial(id).createDeviceType(dt)
          ).map => { success: => @transitionTo("trial", {id}) }



