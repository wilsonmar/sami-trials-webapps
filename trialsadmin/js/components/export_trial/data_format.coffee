React = require("react")

module.exports =

  DataFormat = React.createClass

    getInitialState: ->
      {
        format: "json"
      }
    componentWillReceiveProps: (nextProps) -> 
      @setState {
          format: nextProps.format
        }
    componentDidUpdate: ->
      node = this.refs.jsonRadio
      node = this.refs.csvRadio if @state.format == "csv1"
      node = node.getDOMNode()
      node.checked = true
    activateFilter: (ev) ->
      activeFilter = ev.target.value
      @setState {format: activeFilter}
    getActiveFilter: ->
      return @state.format
    render: ->
          <div className="format-data">
            <span className="format-header">Data format</span>
            <ul className="format-list">
              <li className="form-row">
                <input onClick={@activateFilter} type="radio" name="export_trial_format" id="export_trial_format_json" ref="jsonRadio" value="json" /> 
                <label htmlFor="export_trial_format_json" >JSON </label> 
              </li>
              <li  className="form-row">
                <input onClick={@activateFilter} type="radio" name="export_trial_format" id="export_trial_format_csv" ref="csvRadio" value="csv1" /> 
                <label htmlFor="export_trial_format_csv" >CSV </label>
              </li>
            </ul>
          </div>