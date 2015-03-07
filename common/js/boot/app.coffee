React = require("react")
{BaconMixin} = require("react-bacon")
Bacon = require("baconjs")
_ = require("lodash")
Cookies = require('cookies-js')
Router = require("react-router")

module.exports = ({appName, app, splashScreen}) -> ({gaiaRoot, accountsUrl, loginUrl, logoutUrl, simbaUrl, appId, yourAccountUrl}) ->
  analyticsBus = new Bacon.Bus
  accessToken = Cookies.get('accessToken')
  sessionMonitorUrl = "#{accountsUrl}/currentSessionMonitor?client_id=#{encodeURIComponent(appId)}&token=#{encodeURIComponent(accessToken)}"
  SplashScreen = splashScreen(loginUrl)

  buildApp = (accessToken) ->
    app({gaiaRoot, accountsUrl, accessToken, logoutUrl, simbaUrl, yourAccountUrl, analyticsBus})

  Router.run buildApp(accessToken), (Handler, state) ->
    React.render(
      if accessToken
        <div className="container #{appName}">
          <iframe src={sessionMonitorUrl} width="0" height="0" style={display: 'none'} />
          <Handler params={state.params} />
        </div>
      else
        <div className="container #{appName}">
          <SplashScreen />
          <iframe src={loginUrl} width="0" height="0" style={display: 'none'} />
        </div>
    , document.getElementById('root'))
    analyticsBus.push state.path
