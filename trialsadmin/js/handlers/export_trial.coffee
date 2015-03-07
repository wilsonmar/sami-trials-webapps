React = require("react")
{BaconMixin} = require("react-bacon")
Bacon = require("baconjs")
Router = require("react-router")
merge = require("../../common-js/util/merge")
moment = require("moment")
DatePicker = require("../components/datepicker_jquery")
ExportTrialFilterList = require("../components/export_trial/filter_list")
DataFormat = require("../components/export_trial/data_format")

{Link} = Router
module.exports = (context) ->
  {api, noticeBus, user} = context

  TrialMixin = require("../components/trial_mixin")(context)
  TrialSidebar = require("../components/trial_sidebar")

  React.createClass
    mixins: [TrialMixin, Router.Navigation]

    getInitialState: ->
      limitDays = 29
      now = moment()
      endDate = new Date( now.toISOString() )
      startDate = new Date( now.subtract(29, 'days').toISOString() )

      if @props.params.pastExportRequest? 
        latestExport = JSON.parse(atob(@props.params.pastExportRequest))
        latestExport.startDate = new Date( latestExport.startDate ).getTime()
        latestExport.endDate = new Date( latestExport.endDate ).getTime()
        return {
          latestExport: latestExport
        }
      latestExport: 
        startDate: startDate.getTime()
        endDate: endDate.getTime()

    componentWillMount: ->
      apiTrial = api.Trial(@props.params.id)
      deviceTypes = apiTrial.deviceTypes
      allParticipants = apiTrial.allParticipants().map (result) =>
        result

      latestExport = apiTrial.latestExport.map (result) =>
        return @state.latestExport unless result.exports.length > 0
        result.exports[0].request

      if !@props.params.pastExportRequest?
        @plug(latestExport, "latestExport")
      
      @plug(deviceTypes, "deviceTypes")
      @plug(allParticipants, "allParticipants")
      @plug(user, "user")

    validateErrors: (paramsObj) ->
      valid = true
      if ! @isValidUser()
        valid = false
      if paramsObj.endDate < paramsObj.startDate
        @setState({dateError: "End date cannot be less than Start Date"})
        valid = false
      else if paramsObj.endDate - paramsObj.startDate > 30*24*3600*1000
        @setState({dateError: "Requested date range exceeds 30 days"})
        valid = false
      if !valid 
        return false
      if paramsObj.error?
        noticeBus.push
          message:
            <span>
              <strong>Error: </strong>
              {paramsObj.error.message}
            </span>
          style: 'error'
        return false
      true
    isValidUser: ->
      if @refs.filterList.state.byUser and ! @refs.filterList.refs.byUser.state.selectedParticipant?
        @setState({userError: "Please select a user name when exporting data by trial participant" })
        return false
      true
    requestExport: (ev) ->
      trialId = @props.params.id
      filters = @refs.filterList.getActiveFilter()
      filters.startDate = @refs.startDate.selectedDatetime
      filters.endDate = @refs.endDate.selectedDatetime
      filters.format = @refs.dataFormat.state.format
      ev.preventDefault()
      unless @validateErrors filters
        return false

      api.Trial(trialId).export(filters.startDate, filters.endDate,filters.uids, filters.sdtids, filters.sdids,filters.format).onValue (response) =>
        if response.error?
          noticeBus.push
            message:
              <span>
                <strong>Error: </strong>
                {response.error.message}
              </span>
            style: 'error'
        else
          noticeBus.push
            message:
              <span>
                {"Queued! We'll send an email to #{@state.user.email} when your data is ready. "}
                <a onClick={=> @transitionTo "trialExports", {id: trialId} }>{"View Exports >"}</a>
              </span>
            style: 'success'
          @transitionTo("trial", {id: trialId})
    handleStartDateChange: (timestamp)->
      @state.latestExport.startDate = timestamp
      @checkDates()
    handleEndDateChange: (timestamp)-> 
      @state.latestExport.endDate = timestamp
      @checkDates()
    checkDates: ->
      startDate = @refs.startDate.selectedDatetime
      endDate = @refs.endDate.selectedDatetime
      state = @state
      if endDate < startDate
        state.dateError = "End date cannot be less than Start Date"
        @setState(state)
        return false
      else if endDate - startDate > 30*24*3600*1000
        state.dateError = "Requested date range exceeds 30 days"
        @setState(state)
        return false
      state.dateError = null
      @setState(state)
      true
    render: ->
      <div className="paneled export-trial">
        <TrialSidebar className="left-panel" trial={@state.trial} admins={@state.admins} devices={@state.deviceTypes} totalParticipants={@state.totalParticipants} />
        <form>
          <h1 className="panel-title">Export Data</h1>
          <p>Enter a time range up to 30 days, choose which data to export, and we’ll prepare your download. This can take some time, so we’ll send you an email when it’s ready.</p>
          <div className="date-range-selector-container">
            <div className="range-selector start-date">
              <label>start date</label>
              <DatePicker ref="startDate" inputId="startDate" defaultDate={new Date(@state.latestExport.startDate)} handleDatePickerChange={@handleStartDateChange} />
            </div>
            <div className="separator">to</div>
            <div className="range-selector end-date">
              <label>end date</label>
              <DatePicker ref="endDate" inputId="endDate" defaultDate={new Date(@state.latestExport.endDate)} handleDatePickerChange={@handleEndDateChange} />
            </div>
            <span className="errors">{@state.dateError}</span>
          </div>
          <ExportTrialFilterList
            deviceTypes={@state.deviceTypes}
            allParticipants={@state.allParticipants}
            latestExport={@state.latestExport}
            userError={@state.userError}
            ref="filterList"
          />
          <DataFormat ref="dataFormat" format={if @state.latestExport?.format? then @state.latestExport.format else "json" } />
          <button id="export-data" className="submit-button"
            onClick={@requestExport}
          >
            export data
          </button>
          <Link to="trial" params={{id: @props.params.id}}>
            <button id="cancel-export-data" className="cancel-button">cancel</button>
          </Link>
        </form>
      </div>
