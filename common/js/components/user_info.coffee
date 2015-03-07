React = require("react/addons")
{BaconMixin} = require("react-bacon")


module.exports = ({user, yourAccountUrl, logoutUrl}) ->
  React.createClass
    getInitialState: -> {opened: false}
    mixins: [BaconMixin]
    handleClick: (e)->
      @setState({opened: !@state.opened})
    render: ->
      cx = React.addons.classSet
      classes = cx({
        'user-menu': true
        'has-items': true
        'opened': @state.opened
      })
      <div className={classes} onClick={@handleClick}>
        <div className="name">{@state.user?.fullName}</div>
        <ul className="menu-options">
          <li><a href={"#{yourAccountUrl}&state=#{encodeURIComponent(window.location.hash.substr(1))}"}>Your Account</a></li>
          <li><a href={logoutUrl}>Sign Out</a></li>
        </ul>
      </div>
    componentWillMount: ->
      @plug(user, "user")




