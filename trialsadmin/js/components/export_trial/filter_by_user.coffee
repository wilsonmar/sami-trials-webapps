React = require("react")
{BaconMixin} = require("react-bacon")
Chosen = require("../../../common-js/components/chosen")

module.exports =

  ExportTrialFilterByUser = React.createClass

    mixins: [BaconMixin]

    getInitialState: ->
      {
        allParticipants: [],
        selectedParticipant: @props.latestExport?.uids
      }
    componentWillReceiveProps: (newProps) ->
      if newProps.latestExport? and newProps.latestExport.uids?
        state = @state
        state.selectedParticipant = newProps.latestExport.uids
        @setState state
      
    handleChange: (id) ->
      return null if !id
      this.refs.error.getDOMNode().style.display = "none"
      state = @state
      state.selectedParticipant = id
      @setState state
      console.log(id)

    getFilterParams: ->
      {
        uids: [@state.selectedParticipant];
      }

    render: ->
            <li className="filter by-user-filter form-row">
              { if @props.allParticipants and @props.allParticipants.length > 0
                <div>
                  <input type="radio" name="filter" value="byUser"
                    onChange={@props.onClick}
                    ref="radioInput"
                    defaultChecked={@props.active}
                    id="filterByUser"
                  />
                  <label htmlFor="filterByUser">
                    By Trial Participant
                  </label>
                  { if @props.active
                    <Chosen width="400px" defaultValue={@state.selectedParticipant} data-placeholder="Start typing a name..." onChange={@handleChange}>
                      <option value="-1"></option>
                      {@props.allParticipants.map ({id, fullName}) ->
                        <option key={id} value={id}>{fullName}</option>
                      }
                    </Chosen>
                  }
                  <span ref="error" className="errors">{@props.userError}</span>
                </div>
              }
            </li>
