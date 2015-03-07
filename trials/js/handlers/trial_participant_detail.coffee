React = require("react")
Moment = require("moment")
Router = require("react-router")
{Link} = Router
{BaconMixin} = require("react-bacon")
Bacon = require("baconjs")

module.exports = (context) ->
  {userId, simbaUrl, api, accessToken, popupFrameBus} = context

  Device = require('../../common-js/components/device')(context)
  DeviceType = require('../components/device_type')(context)

  React.createClass
    mixins: [BaconMixin, Router.Navigation]
    getInitialState: -> {}

    details: (trial) ->
      <div className="left-panel">
        <h1 className="panel-title">{trial.name}</h1>
        <div className="trial-meta">
          <div className="trial-date">{[
              Moment(trial.startDate).format('MMMM D').toUpperCase(),
              <span>&#8212;</span>,
              if trial.endDate then Moment(trial.endDate).format('MMMM D').toUpperCase() else 'now'
            ]}</div>
        </div>
        <div className="description">{trial.description}</div>
      </div>

    disconnectDeviceFromTrial: (device, trial) ->
      userId.flatMap (userId) =>
        api.User(userId)
          .Trial(trial.id)
          .Device(device.id)
          .disconnect

    connectTrialDevice: (device) ->
      if device.new
        connectedDevices = @state.connectedDevices
        connectedDevices.push device
        @setState {connectedDevices}

      userId.flatMap (userId) =>
        api.User(userId)
          .Trial(@state.trial.id)
          .createDevice({did: device.id})

    deviceConnected: (device) ->
      @connectTrialDevice(device).onValue =>
        devices = @state.devices
        devices.push(device)
        @setState(devices: devices)

    deviceDisconnected: (device) ->
      if confirm("Are you sure you want to disconnect this device from the trial? No further data will be collected and you will no longer be able to access your data from this trial.")
        devices = @disconnectDeviceFromTrial(device, @state.trial).map (v)=>
          @state.devices.filter (d) -> d.id != device.id
        @plug(devices, 'devices')

    render: ->
      <div className="trial-participant-detail">
        <div className="paneled">
          {if (trial = @state.trial)?
            @details(trial)
          }

          <div className="main-panel">
            {unless (devices = @state.devices || []).length == 0
              <div className="device-list">
                <h2>
                  Your Connected Devices <Router.Link className="view-data" to="viewData" params={id: @props.params.id}>View Your Trial Data</Router.Link>
                </h2>
                <ul>
                  {devices.map (device) =>
                    <li key={device.id}>
                      <Device
                        device={device}
                        onDisconnect={@deviceDisconnected}
                        onViewData={(e)=> @transitionTo('viewData', id: @props.params.id)}
                      />
                    </li>
                  }
                </ul>
              </div>
            }

            {if (deviceTypes = @state.deviceTypes || []).length > 0
              <div className="device-list">
                <h2>Other Devices</h2>
                <ul>
                  {deviceTypes
                    .filter((dt)=>
                      dt.id not in (@state.devices || []).map((d)-> d.dtid)
                    ).map (deviceType) =>
                    <li key={deviceType.id}>
                      <DeviceType
                        deviceType={deviceType}
                        onConnect={@deviceConnected}
                        connectedDevices={(@state.connectedDevices || []).filter((device)-> device.dtid == deviceType.id)}
                      />
                    </li>
                  }
                </ul>
              </div>
            }
          </div>
        </div>
      </div>

    componentDidMount: ->
      id = @props.params.id
      trial = api.Trial(id).fetch
      @plug(trial, "trial")

      devices = userId.flatMap (userId) ->
        api.User(userId)
          .Trial(id)
          .devices
      @plug(devices, "devices")

      deviceTypes = api.Trial(id).deviceTypes
      @plug(deviceTypes, "deviceTypes")

      connectedDevices = userId.flatMap (userId) =>
        api.User(userId).devices
      @plug(connectedDevices, "connectedDevices")

      @plug(userId, "userId")
