form = require("../../common-js/components/form")
React = require("react")
Router = require("react-router")
{BaconMixin} = require("react-bacon")
InviteParticipantsForm = require("./invite_participants_form")
merge = require("../../common-js/util/merge")

module.exports = ({api}) ->
  React.createClass
    mixins: [BaconMixin]
    render: ->
      editing = (@props.trial)?
      <@Form>
        <label className="form-row">
          <span className="label-text">TRIAL NAME</span>
          <@ValidationFor name="name">
            <@RemainingText for="name">
              <@Inputs.Input id="trial-name" type="text" maxLength="50" placeholder="Name" name="name" />
            </@RemainingText>
          </@ValidationFor>
        </label>

        <label className="form-row">
          <span className="label-text">DESCRIPTION (optional)</span>
          <@ValidationFor name="description">
            <@RemainingText for="description">
              <@Inputs.TextArea id="trial-description" rows="4" maxLength="255" placeholder="Description" name="description"/>
            </@RemainingText>
          </@ValidationFor>
        </label>

        <label className="form-row">
          <span className="label-text">DEVICE TYPES</span>
          <@Inputs.Chosen
            id="trial-device-types"
            options={(@state?.deviceTypes || [])}
            name="deviceTypes"
            multiple
            data-placeholder="Add devices: begin typing a device name…"
            onlyAllowAppend={editing}
          />
        </label>

        {unless editing
          <div>
            <label className="form-row">
              <span className="label-text">ADDITIONAL ADMINS (optional)</span>
              <@ValidationFor name="administrators">
                <@Inputs.TextArea id="trial-admins" rows="2" placeholder="Add Admins by email, comma separated" name="administrators"/>
              </@ValidationFor>
            </label>

            <label className="form-row">
              <span className="label-text">INVITE PARTICIPANTS</span>
              <@ValidationFor name="participants">
                <@Inputs.TextArea id="trial-participants" rows="2" placeholder="By email, comma separated" name="participants"/>
              </@ValidationFor>
            </label>
          </div>
        }

        <button id="save-trial-button" className="submit-button" type="submit">
          {if editing then "Save Changes" else "Save Trial"}
        </button>

        {if editing
          <Router.Link id="cancel-trial-button" to="trial" params={id: @props.trial?.id} className="cancel-button">Cancel</Router.Link>
         else
          <Router.Link id="cancel-trial-button" to="index" className="cancel-button">Cancel</Router.Link>
        }
      </@Form>

    componentWillMount: ->
      deviceTypes = api.allDeviceTypes().map (deviceTypes) ->
        deviceTypes.filter (d) -> d.published

      @plug(deviceTypes, "deviceTypes")

      codecs = merge(require("../shared/invitation_codecs"), {
        deviceTypes: {
          to: (ids) -> ids.map (id) -> {dtid: id}
          from: (dts) -> dts.map ({id}) -> id
        }
      })


      {@Form, @Inputs, @ValidationFor, @RemainingText} = form(
        schema: require("../schemas/trial")
        onSubmit: @props.onSubmit
        initialData: @props.trial
        codecs: codecs
      )




