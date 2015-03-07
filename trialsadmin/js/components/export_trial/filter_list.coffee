React = require("react")

ExportTrialFilterAll = require("./filter_all")
ExportTrialFilterByDeviceType = require("./filter_by_device_type")
ExportTrialFilterByUser = require("./filter_by_user")

module.exports =

  ExportTrialFilterList = React.createClass

    getInitialState: ->
      {
        allData: true
        byDeviceType: false
        byUser: false
        latestExport: {}
        userError: null
      }

    activateFilter: (ev) ->
      activeFilter = ev.target.value
      newState = {}
      latestExport = @state.latestExport
      for key of @state
        if activeFilter is key
          newState[key] = true
        else
          newState[key] = false
      newState.latestExport = latestExport
      @setState newState
      @refs.byUser.refs.error.getDOMNode().innerHTML = ""
    getActiveFilter: ->
      activeFilter
      for filter, state of @state
        if state is true
          activeFilter = filter
      @refs[activeFilter].getFilterParams()

    componentWillReceiveProps: (nextProps) -> 
      @setState {userError: nextProps.userError}
      if @state.latestExport.trialId?
        return
      byDeviceType = if nextProps.latestExport.sdtids? then true else false
      byUser = if !byDeviceType and nextProps.latestExport.uids? then true else false
      allData = if !byDeviceType and !byUser then true else false

      @setState {
          allData: allData
          byDeviceType: byDeviceType
          byUser: byUser
          latestExport: nextProps.latestExport
        }
      
    componentDidUpdate: ->
      node = this.refs.allData
      node = this.refs.byDeviceType if @state.byDeviceType
      node = this.refs.byUser if @state.byUser
      if !node.refs.radioInput?
        return
      node = node.refs.radioInput.getDOMNode()
      node.checked = true
    render: ->
          <ul className="filters-list">
            <ExportTrialFilterAll
              onClick={@activateFilter}
              active={@state.allData}
              ref="allData"
            />
            <ExportTrialFilterByDeviceType
              onClick={@activateFilter}
              active={@state.byDeviceType}
              deviceTypes={@props.deviceTypes}
              latestExport={@props.latestExport}
              ref="byDeviceType"
            />
            <ExportTrialFilterByUser
              onClick={@activateFilter}
              active={@state.byUser}
              allParticipants={@props.allParticipants}
              latestExport={@props.latestExport}
              userError={@state.userError}
              ref="byUser"
            />
          </ul>