React = require("react")
Cookies = require('cookies-js')
SetReturnMixin = require('../../common-js/components/set_return_mixin')

module.exports = (loginUrl) ->
  Layout = require("../../common-js/components/layout")(null)

  Content = React.createClass
    mixins: [SetReturnMixin]
    render: ->
      <div className="trial-participants-landing">
        <div className="landing-subheader">
          <img src="/assets/images/tools/landing/developer-home.png"/>
          <h1 className="landing-title">Participate in group studies around lifestyle products and services with the <strong>SAMI Trial Tool</strong></h1>
          <a onClick={@setReturnUrl} className="landing-button" href={loginUrl}>BECOME A TRIAL PARTICIPANT »</a>
        </div>
        <div className="landing-content">
          <ul>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/devices.png"/>
              </div>
              <h2>Wide variety of devices</h2>
              <span>Everything works. Connect your devices that have been selected for the study.</span>
            </li>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/data.png"/>
              </div>
              <h2>Real-time data monitoring</h2>
              <span>Track your participation. Monitor data the moment it is sent from your device. </span>
            </li>
            <li>
              <div className="image-container">
                <img src="/assets/images/tools/landing/visualize.png"/>
              </div>
              <h2>Powerful data visualization</h2>
              <span>Sum up your data in a customizable visualization tool.</span>
            </li>
          </ul>
        </div>
      </div>

  React.createClass
    mixins: [SetReturnMixin]
    render: ->
      <Layout analytics="UA-54296710-9" splashContent={Content}>
        <ul>
          <li><a href="" className="trials active">Trial Participant</a></li>
        </ul>
        <div className="user-menu">
          <a onClick={@setReturnUrl} href={loginUrl} className="sign-in">Sign In…</a>
        </div>
      </Layout>
