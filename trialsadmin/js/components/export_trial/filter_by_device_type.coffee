React = require("react")
ExportTrialDeviceTypeFilter = require("./device_type_filter")

module.exports =

  ExportTrialFilterByDeviceType = React.createClass

    getInitialState: ->
      deviceTypes: {}
      errorMessages:
        noSelection : "You must select at least one Device Type"
        limitReach : "You can only select up to 25 Device Types"

    onFilterCheck: (ev) ->
      selectedDeviceType = (
        deviceType for deviceType in @props.deviceTypes when deviceType.id is ev.target.value
      )
      if selectedDeviceType and selectedDeviceType.length > 0
        selectedDeviceType[0].filterActive = ev.target.checked

    validate: (activeFilters) ->
      if activeFilters.length is 0
        return @state.errorMessages.noSelection
      else if activeFilters.length is 25
        return @state.errorMessages.limitReach
      else
        return true

    getFilterParams: ->
      activeFilters = (
        deviceType.id for deviceType in @props.deviceTypes when deviceType.filterActive
      )
      validation = @validate activeFilters
      if validation is true
        {
          sdtids: activeFilters
        }
      else
        {
          error:
            message: validation
        }

    componentWillReceiveProps: (newProps) ->
      if newProps.latestExport? and newProps.latestExport.sdtids? and newProps.deviceTypes?
        checkedDeviceTypes = newProps.latestExport.sdtids.split(",")
        for deviceType in newProps.deviceTypes
          deviceType.filterActive = checkedDeviceTypes.indexOf(deviceType.id) > -1

    render: ->
            <li className="filter by-device-type-filter form-row">
              <input type="radio" name="filter" value="byDeviceType"
                onChange={@props.onClick}
                ref="radioInput"
                defaultChecked={@props.active}
                id="filterByDeviceType"
              />
              <label htmlFor="filterByDeviceType">
                By Device Type 
              </label>
              { if @props.active
                <ul className="device-type-filters-list">
                {
                  if @props.deviceTypes and @props.deviceTypes.length > 0
                    for deviceType in @props.deviceTypes

                      <ExportTrialDeviceTypeFilter
                        name={deviceType.name}
                        id={deviceType.id}
                        onFilterCheck={@onFilterCheck}
                        active={deviceType.filterActive}
                      />
                }
                </ul>
              }
            </li>