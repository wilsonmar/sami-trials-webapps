React = require("react")
Router = require("react-router")
Bacon = require("baconjs")
merge = require("../../common-js/util/merge")
Moment = require("moment")

module.exports = (context) ->
  Modal = require("../components/modal")

  {api} = context
  PARTICIPANT_PAGE_COUNT = 10

  TrialMixin = require("../components/trial_mixin")(context)
  TrialSidebar = require("../components/trial_sidebar")
  TrialForm = require("../components/trial_form")(context)
  Paginate = require("../components/paginate")

  participantsOffsetBus = (new Bacon.Bus)
  selectedParticipantsBus = new Bacon.Bus

  React.createClass
    mixins: [TrialMixin]
    getInitialState: ->  {}

    onPaginateParticipants: (offset) ->
      participantsOffsetBus.push(offset)

    componentWillMount: ->
      @deletedParticipantsCount = -1
      selectedParticpants = selectedParticipantsBus.scan([], (a, b) ->
        if b.delete
          a = []
        if b.checked
          a.push(b.id); a # add to array
        else
          a.filter (id)-> id != b.id # remove from array
      )

      this.refreshParticipants()
      @plug selectedParticpants, 'selectedParticipants'

    refreshParticipants:->
      id = @props.params.id
      apiTrial = api.Trial(id)

      participantsPage = participantsOffsetBus.toProperty(0).flatMapLatest (offset) ->
        apiTrial.participantsPage(PARTICIPANT_PAGE_COUNT, offset)

      participants = participantsPage.flatMapLatest (page) ->
        page.data.participants

      participantsWithDevices = participants.flatMapLatest (participants) ->
        Bacon.combineAsArray(participants.map (participant) ->
          Bacon.combineTemplate(
            devices: apiTrial.Participant(participant.id).devices
          ).map (extra) -> merge(participant, extra)
        ).flatMapLatest((participants) ->
          allDeviceIds = [].concat.apply([],
             participants.map((participant) ->
              participant.devices.map (device) ->
                device.id
             )
          )

          allDeviceHistory = api.DeviceHistory(allDeviceIds).map((data) ->
            d = {}
            (data || []).map (deviceData) ->
              d[deviceData.sdid] = deviceData.ts
            d
          )

          Bacon.combineAsArray(participants.map (participant) ->
            Bacon.combineTemplate(
              history: allDeviceHistory
            ).map ({history}) ->
              merge(participant, devices: participant.devices.map (device) ->
                merge(device, lastActive: history[device.id])
              )
          )
        )
      .toProperty()

      @plug(participantsWithDevices, 'participants')
      @plug(participantsPage, 'participantsPage')

    render: ->
      selectedToDelete = (@state?.selectedParticipants || []).length

      <div className="paneled">
        <TrialSidebar className="left-panel" trial={@state.trial} admins={@state.admins} devices={@state.deviceTypes} totalParticipants={@state.totalParticipants} />
        <div className="participants">
          {@toggleButton()}
          {if selectedToDelete > 0
            <div className="delete-msg" onClick={=> @setState(showDeleteModal: true)}>
              <i className="icon-level-down arrow" />
              <i className="icon-trash" />
              Delete {selectedToDelete} selected participant{'s' if selectedToDelete > 1}...
            </div>
          }
          {if page = @state.participantsPage
            <Paginate count={PARTICIPANT_PAGE_COUNT} total={page.total} offset={page.offset} onPaginate={@onPaginateParticipants}>
              {@participants @state.participants || []}
            </Paginate>
          }
        </div>
        <Modal visible={@state.showDeleteModal} onClose={=> @deletedParticipantsCount = -1; @setState(showDeleteModal: false)}>
          {if @deletedParticipantsCount == -1
            <div>
              <h1>Delete these users from the Trial?</h1>
              <p>The selected users will no longer be included in the Trial and all past data will be removed. Are you sure you wish to delete these users?</p>
              <button className="button button-red" type="submit" onClick={this._deleteSelectedParticipants}>
                Delete Users
              </button>
              <button className="button" type="button" onClick={=> @setState(showDeleteModal: false)}>
                {"Don't Delete"}
              </button>
            </div>
          else
            <div>
              <p> {@deletedParticipantsCount} Participant{'s were' if @deletedParticipantsCount != 1} {'was' if @deletedParticipantsCount == 1} deleted from this trial </p>
            </div>
          }
        </Modal>
      </div>

    participants: (participants)->
      selectedParticipants = (@state?.selectedParticipants || [])

      <form className="participants-list">
        <table id="active-participants-table" className="participants-table">
          <thead>
            <tr>
              <th>
                <div className="form-row">
                  <input id="deleteCheckbox-All" name="deleteCheckAll" type="checkbox" onChange={this._checkAll}/>
                  <label htmlFor="deleteCheckbox-All" />
                </div>
              </th>
              <th>NAME</th>
              <th>DEVICE TYPE(S)</th>
              <th>CONNECTED</th>
              <th>LAST ACTIVE</th>
            </tr>
          </thead>
          <tbody>
            {participants.map (participant) =>
              <tr key={participant.id}>
                <td >
                  <div className="form-row">
                    <input id={'deleteCheckbox' + participant.id} data-id={participant.id} type="checkbox" checked={participant.id in selectedParticipants} onChange={@_selectParticipant(participant.id)}/>
                    <label htmlFor={'deleteCheckbox' + participant.id}/>
                  </div>
                </td>
                <td className="participant-name">
                  {if participant.devices?.length > 0
                    <Router.Link to="viewData" params={id: @state.trial.id, uid: participant.id}>
                      {participant.fullName}
                    </Router.Link>
                  else
                    participant.fullName
                  }
                </td>
                <td className="participant-device">
                  <ul>
                  {(participant.devices || []).map (device) ->
                    <li>{device.name}</li>
                  }
                  </ul>
                </td>
                <td className="participant-connected">
                  <ul>
                    {(participant.devices || []).map (device) ->
                      <li>{Moment(device.connectedOn).format('MMMM D')}</li>
                    }
                  </ul>
                </td>
                <td className="participant-last-active">
                  <ul>
                    {(participant.devices || []).map (device) ->
                      <li>{if device.lastActive then Moment(device.lastActive).format('MMMM D') else 'Never'}</li>
                    }
                  </ul>
                </td>
              </tr>
            }
          </tbody>
        </table>
      </form>

    _deleteSelectedParticipants: (event) ->
      participants = @state?.selectedParticipants || []
      if participants.length > 0
        @deletedParticipantsCount = 0
        apiTrial = api.Trial(@props.params.id)
        trial_detail = this
        
        streams = []
        participants.map (participantID) ->
          streams.push apiTrial.Participant(participantID).delete.toEventStream()

        streams = Bacon.mergeAll(streams)

        streams.subscribe (event) ->
          if event.valueInternal
            trial_detail.deletedParticipantsCount++ unless event.valueInternal.error
          else
            #stream ends
            selectedParticipantsBus.push {delete: true}
            participantsOffsetBus.push 0
            trial_detail.refreshParticipants()

    _selectParticipant: (id) ->
      a = this
      (e)->
        selectedParticipantsBus.push {id: id, checked: e.target.checked}
        e.target.form.deleteCheckAll.checked = false unless e.target.checked

    _checkAll: (event) ->
      selected = (@state?.selectedParticipants || [])
      checked = event.target.checked
      form = event.target.form

      for input in form when input.dataset.id isnt undefined and (input.dataset.id not in selected || !checked)
        selectedParticipantsBus.push {id: input.dataset.id, checked: checked}
