React = require("react")
Router = require("react-router")
{Navigation} = Router

module.exports = ({api, noticeBus}, admin) ->
  React.createClass
    mixins: [Navigation]
    render: -> null
    componentWillMount: ->
      trialId = @props.params.id
      inviteId = @props.params.iid

      api.Trial(trialId).Invite(inviteId).update(
        status: 'accepted'
      ).onValue (v) =>
        if invite = v.data
          noticeBus.push(message:
            if admin
              'Welcome to your new Trial.'
            else
              'Welcome to your new Trial. To get started, please take a moment to connect your devices:'
          )
          @transitionTo("trial", {id: trialId})
        else
          noticeBus.push(message: 'We were unable to accept that invitation. Please check that it is not expired and that you are logged in with an account matching the email to which the invite was sent.')
          @transitionTo("index")
