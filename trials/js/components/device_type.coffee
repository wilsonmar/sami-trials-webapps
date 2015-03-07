React = require("react")
merge = require("../../common-js/util/merge")
form = require("../../common-js/components/form")

module.exports = (context) ->
  {userId, api, noticeBus} = context
  Modal = require("../../common-js/components/modal")
  TruncateTextMixin = require("../../common-js/components/truncate_text_mixin")
  EnterPinForm = require("./enter_pin_form")(context)

  React.createClass
    mixins: [TruncateTextMixin]
    getInitialState: -> {}

    connectUserDevice: (deviceType) ->
      userId.flatMap (userId) =>
        data =
          dtid: deviceType.id
          name: deviceType.name

        api.User(userId).connectDevice(data)

    connectNewDevice: (e)->
      e.preventDefault() if e
      deviceType = @props.deviceType
      if deviceType.rsp
        @setState(
          showEnterPin: true
          showExistingChooser: true)
      else
        @setState(showExistingChooser: false)
        @connectUserDevice(deviceType).onValue ({data}) =>
          device = merge(data,
            new: true
          )
          @props.onConnect(device)

    connectDevice: ->
      if @props.connectedDevices.length == 0
        @connectNewDevice()
        return

      if @props.connectedDevices.length == 1
        @props.onConnect(@props.connectedDevices[0])
        return

      @setState(showExistingChooser: true)

    connectExistingDevice: ({device})->
      @setState(showExistingChooser: false)
      selectedDevice = @props.connectedDevices.filter((d)-> d.id == device)[0]
      @props.onConnect(selectedDevice)

    componentWillMount: ->
      {@Form, @Inputs} = form(
        onSubmit: @connectExistingDevice
        schema: properties: {}
      )

    showPinError: ->
      @setState(
        showExistingChooser: false
        showEnterPin: false)
      noticeBus.push(
        style: 'error'
        message: 'Oops, something went wrong connecting this device. Check the device for errors and try again.'
      )


    pinDeviceRegistered: (device)->
      @setState(
        showExistingChooser: false
        showEnterPin: false)
      @props.onConnect(device)

    render: ->
      deviceType = @props.deviceType
      <div className="device-type">
        <Modal className="device-select-form" visible={@state.showExistingChooser} onClose={=> @setState(showExistingChooser: false)}>
          {if @state.showEnterPin
            <EnterPinForm deviceType={deviceType} onPinError={@showPinError} onDeviceRegistered={@pinDeviceRegistered} />
          else
            <div>
              <h1>Use your existing {deviceType.name}?</h1>
              <p>You can use one of the devices that you have already connected to SAMI or you can set up a new device.</p>
              <@Form>
                <label className="form-row">
                  <@Inputs.Select name="device" options={@props.connectedDevices} />
                </label>
                <button className="submit-button use-existing-button">USE EXISTING DEVICE</button>
                <a className="submit-button new-device-button" href="#" onClick={@connectNewDevice}>SET UP NEW DEVICE</a>
              </@Form>
            </div>
          }
        </Modal>

        <div className="device-title">
          <a className="truncate-title" ref="truncateTitle" title={deviceType.name}>{@state?.truncatedTitle}</a>
          <div onClick={@connectDevice} className="connect-button">CONNECT</div>
        </div>
      </div>
