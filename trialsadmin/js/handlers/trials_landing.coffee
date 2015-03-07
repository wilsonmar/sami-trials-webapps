React = require("react")
Cookies = require('cookies-js')

module.exports = (loginUrl) ->
  Layout = require("../../common-js/components/layout")(null)

  Content = React.createClass
    render: ->
      <div className="trials-landing">
        <div className="landing-subheader">
          <img src="/assets/images/tools/landing/developer-home.png"/>
          <h1 className="landing-title">Conduct group studies around lifestyle products and services in controlled environments with the <strong>SAMI Trial Tool</strong></h1>
          <a className="landing-button" href={loginUrl}>BECOME A TRIAL ADMIN »</a>
        </div>
        <div className="landing-content">
          <ul>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/devices.png"/>
              </div>
              <h2>Wide variety of devices</h2>
              <span>Get data from any kind of device. Combine data from multiple devices and understand what's happening in context.</span>
            </li>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/data.png"/>
              </div>
              <h2>Real-time data monitoring</h2>
              <span>Respond to data the moment it's sent. Share it with your peers, adjusts study parameters, or notify trial participants.</span>
            </li>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/visualize.png"/>
              </div>
              <h2>Powerful data visualization</h2>
              <span>Comprehensive reports sum up the data you've amassed so that you can find new, unexpected correlations.</span>
            </li>
          </ul>
        </div>
      </div>

  React.createClass
    setReturnUrl: ->
      Cookies.set('returnPath', window.location.hash)

    render: ->
      <Layout analytics="UA-54296710-10" splashContent={Content}>
        <ul>
          <li><a href="" className="trials active">Trial Management</a></li>
        </ul>
        <div className="user-menu">
          <a onClick={@setReturnUrl} href={loginUrl} className="sign-in">Sign In…</a>
        </div>
      </Layout>
