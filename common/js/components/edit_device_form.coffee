form = require("./form")
React = require("react")
{BaconMixin} = require("react-bacon")
Moment = require("moment")

module.exports = ({api})->
  React.createClass
    mixins: [BaconMixin]
    getInitialState: -> {}
    render: ->
      device = @props.device
      <div className="edit-device-form">
        <ul>
          <li>
            <span className="label-text">DEVICE TYPE</span>
            {device.name}
          </li>
          <li>
            <span className="label-text">CONNECTED SINCE</span>
            {Moment(device.connectedOn).format('MMMM D, YYYY')}
          </li>
          <li>
            <span className="label-text">LAST DATA TRANSFER</span>
            {if (deviceHistory = @state.deviceHistory) && deviceHistory.length > 0
              Moment(deviceHistory[0].ts).format('MMMM D, YYYY')
            else
              "Never"
            }
          </li>
        </ul>

        <ul className="edit-device-id">
          <li>
            <span className="label-text">DEVICE ID</span>
            {device.id}
          </li>
        </ul>

        <@Form>
          <label className="form-row">
            <span className="label-text">NAME</span>
            <@ValidationFor name="name">
              <@RemainingText for="name">
                <@Inputs.Input id="name" type="text" maxLength="32" placeholder="" name="name"/>
              </@RemainingText>
            </@ValidationFor>
          </label>

          <div className="edit-device-tokens">
            {if token = @state.accessToken
              <label className="form-row">
                <span className="label-text">DEVICE TOKEN</span>
                <p>{token}</p>
                <a href="#" className="revoke-access-token" onClick={@revokeToken}>REVOKE TOKEN</a>
              </label>
            else
              <a href="#" className="generate-access-token" onClick={@generateToken}>GENERATE DEVICE TOKEN...</a>
            }
          </div>

          <button className="submit-button" type="submit">
            SAVE CHANGES
          </button>
          <a href="#" className="disconnect-device" onClick={@disconnectDevice}>DISCONNECT DEVICE</a>
        </@Form>
      </div>

    disconnectDevice: (e) ->
      e.preventDefault()
      @props.onDisconnect?()

    revokeToken: (e) ->
      e.preventDefault()

      accessToken = api.Device(@props.device.id)
        .deleteToken.map (r) -> null

      @plug(accessToken, 'accessToken')

    generateToken: (e) ->
      e.preventDefault()

      accessToken = api
        .Device(@props.device.id)
        .createToken.map ({data})->
          data.accessToken

      @plug(accessToken, 'accessToken')

    componentWillMount: ->
      accessToken = api
        .Device(@props.device.id)
        .token.map ({data})->
          if data
            data.accessToken
          else
            null

      @plug(accessToken, 'accessToken')

      deviceHistory = api.DeviceHistory([@props.device.id]).map (r) ->
        r?.data

      @plug(deviceHistory, 'deviceHistory')

      {@Form, @Inputs, @ValidationFor, @RemainingText} = form(
        onSubmit: @props.onSubmit
        schema: require("../schemas/device")
        initialData: @props.device
      )
