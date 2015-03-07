React = require("react")
form = require("../../common-js/components/form")
Bacon = require('baconjs')
{BaconMixin} = require("react-bacon")

module.exports = ({api})->
  deviceName = null
  React.createClass
    mixins: [BaconMixin]
    tryPinAuth: (data)->
      serverErrors = new Bacon.Bus

      deviceName = data.name
      api.DevicePin.update(
        pin: data.pin,
        deviceName: deviceName
      ).onValue (r)=>
        if r.error
          serverErrors.push {errors: [[{
            field: 'pin'
            message: 'Unable to validate that PIN. Check the device and try again'
          }]]}
        else
          @setState(pin: {status: 'pending'})
          @plug @pollForPinStatus(r.data.rid), 'pin'

      serverErrors.toProperty()

    pollForPinStatus: (rid) ->
      impl = (retries) ->
        if retries >= 15
          Bacon.once({status: "timeout"})
        else
          api.DevicePin.fetchStatus(rid: rid).map (r) ->
            if r.error then {status:"error"} else r.data
          .flatMapLatest (r) ->
            unless r.status in ["pending", "pending device completion"]
              Bacon.once(r)
            else
              Bacon.later(1000).flatMapLatest -> impl(retries + 1)

      impl(0).toProperty()

    componentWillMount: ->
      {@Form, @Inputs, @ValidationFor, @RemainingText} = form(
        onSubmit: @tryPinAuth
        schema: properties: {}
      )

    componentDidUpdate: (prevProps, prevState)->
      if @state.pin?.status == "registered"
        @props.onDeviceRegistered?(
          dtid: @props.deviceType.id
          id: @state.pin.did
          name: deviceName
          new: true
        )
        @setState(pin: null)
      if @state.pin?.status in ["error", "timeout"]
        @props.onPinError?()

    render: ->
      deviceType = @props.deviceType
      <div className="enter-pin-form">
        <h1>Activate your {deviceType.name}</h1>
        {if deviceType.uniqueName == "io.simband.simband"
          <div className="simband-config-steps">
            <div className="simband-step-one">
              <h2><b>1.</b> From Simband lock screen, swipe up</h2>
              <p>then go to Settings » Simband » Register to SAMI</p>
            </div>
            <div className="simband-step-two">
              <h2><b>2.</b> A code will be displayed on your device</h2>
              <p>enter it in the field and click “Connect Device”</p>
            </div>
          </div>
        }

        <@Form>
          <label className="form-row">
            <span className="label-text">PLEASE ENTER YOUR ACTIVATION CODE:</span>
            <@ValidationFor name="pin">
              <@RemainingText for="pin">
                <@Inputs.Input id="pin" type="text" maxLength="32" placeholder="" name="pin"/>
              </@RemainingText>
            </@ValidationFor>
          </label>

          <label className="form-row">
            <span className="label-text">CHOOSE A NAME FOR YOUR {deviceType.name.toUpperCase()}:</span>
            <@ValidationFor name="name">
              <@RemainingText for="name">
                <@Inputs.Input id="name" type="text" maxLength="32" placeholder="" name="name"/>
              </@RemainingText>
            </@ValidationFor>
          </label>
          {if @state?.pin?.status in ["pending", "pending device completion"]
            <div className="submit-button connecting">
              CONNECTING
              <span className="one">.</span>
              <span className="two">.</span>
              <span className="three">.</span>
            </div>
          else
            <button className="submit-button">ACTIVATE SIMBAND</button>
          }
        </@Form>
      </div>
