React = require("react/addons")
Moment = require("moment")
{BaconMixin} = require("react-bacon")
Cookies = require('cookies-js')

module.exports = (context) ->
  {userId, gaia, simbaUrl, accessToken, gaiaRoot, api} = context
  Modal = require("./modal")
  EditDeviceForm = require("./edit_device_form")(context)
  TruncateTextMixin = require("./truncate_text_mixin")

  React.createClass
    mixins: [BaconMixin, TruncateTextMixin]
    getInitialState: -> {}

    disconnectDevice: ->
      @props.onDisconnect(@props.device)

    authorize: ->
      Cookies.set('deviceAuthReturnPath', window.location.hash)

    authorizeButton: ->
      <form ref="authorizeForm" onSubmit={@authorize} method="post" action="#{gaiaRoot}/devices/#{@props.device.id}/providerauthwithtoken">
        <input type="hidden" value={accessToken} name="token" />
        <button className="auth-button">AUTHORIZE</button>
      </form>

    editDevice: (e)->
      e.preventDefault()
      @setState(editDevice: true)

    updateDevice: (data) ->
      userId.flatMapLatest (userId) ->
        api.User(userId).updateDevice(data)
      .onValue (r) =>
        @setState(
          device: r.data
          editDevice: false
        )
        @handleResize()

    viewData: (e)->
      e.preventDefault()
      @props.onViewData?()

    render: ->
      device = @state.device || @props.device

      cx = React.addons.classSet
      classes = cx({
        'device': true
        'needs-auth': device.needProviderAuth
      })

      <div className={classes}>
        <Modal visible={@state.editDevice} onClose={=> @setState(editDevice: false)}>
          <h1>Device Info</h1>
          <EditDeviceForm device={device} onSubmit={@updateDevice} onDisconnect={@disconnectDevice} />
        </Modal>

        <div className="device-title">
          <a className="truncate-title" ref="truncateTitle" href="#" title={device.name} onClick={@editDevice}>
            {@state?.truncatedTitle}
          </a>
          {@authorizeButton()}
          <a className="device-view-data" href="#" onClick={@viewData} />
        </div>
        <div className="device-footer">
          <i className="device-connected">Connected {Moment(device.createdOn).format('MMMM D, YYYY')}</i>
          <span onClick={@disconnectDevice} className="disconnect">DISCONNECT</span>
        </div>
      </div>

    componentDidUpdate: ->
      if @props.device.needProviderAuth && @props.device.new
        @authorize()
        @refs.authorizeForm.getDOMNode().submit()
