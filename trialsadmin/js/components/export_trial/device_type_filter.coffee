React = require("react")

module.exports =

  ExportTrialDeviceTypeFilter = React.createClass

    render: ->
      <li className="device-type-filter">
        <input type="checkbox"
          name={@props.name}
          value={@props.id}
          onChange={@props.onFilterCheck}
          defaultChecked={@props.active}
          id={"filterByDeviceType" + @props.id}
        />
        <label htmlFor={"filterByDeviceType" + @props.id}>
          {@props.name}
        </label>
      </li>