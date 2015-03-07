React = require("react")

module.exports =

  ExportTrialFilterAll = React.createClass

    getFilterParams: ->
      {}

    render: ->
            <li className="filter all-data-filter form-row">
              <input type="radio" name="filter"
                value="allData"
                ref="radioInput"
                onChange={@props.onClick}
                defaultChecked={@props.active}
                id="filterAll"
              />
              <label htmlFor="filterAll">
                All Data
              </label>
            </li>