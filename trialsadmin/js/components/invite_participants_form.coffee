React = require("react")
form = require("../../common-js/components/form")

module.exports = (context) ->
  React.createClass
    render: ->
      <@Form>
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

        <button id="invite-button" className="submit-button" type="submit">
          Invite more people
        </button>
      </@Form>

    componentWillMount: ->
      {@Form, @Inputs, @ValidationFor} = form(
        schema: require("../schemas/invitations")
        onSubmit: @doSubmit
        codecs: require("../shared/invitation_codecs")
      )

    doSubmit: ({participants, administrators}) ->
      @props.onSubmit(invitations: (participants || []).concat(administrators || []))



