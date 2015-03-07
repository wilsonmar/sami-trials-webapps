React = require("react/addons")
{Link} = require("react-router")
ga = require('react-google-analytics')
Bowser = require("bowser")
{BaconMixin} = require("react-bacon")
Router = require("react-router")

module.exports = (context) ->
  if context
    {noticeBus} = context
    UserInfo = require("./user_info")(context)
    Notice = require("./notice")(noticeBus)

  Modal = require("./modal")
  UserVoiceLink = require('./user_voice_link')
  TermsOfService = require('./terms_of_service')
  PrivacyPolicy = require('./privacy_policy')
  IframeResizerScript = require('./iframe_resizer_script')

  React.createClass
    mixins: [BaconMixin]

    getInitialState: ->
      env = /^[a-z\-]*-([a-z]*)\./i.exec(window.location.hostname)
      if env = env?[1]?.toLowerCase()
        env: env
        showEnv: env in ['dev', 'qa', 'stg']
      else
        {}

    componentDidMount: ->

      if context
        @plug(context.hideFooterBus, 'noFooter')
        @plug(context.user, 'user')
        context.analyticsBus.onValue (route) =>
          ga('create', @props.analytics, 'auto')
          ga('send', 'pageview', route)
      else # landing page
        ga('create', @props.analytics, 'auto')
        ga('send', 'pageview')

    render: ->
      return null if context && !@state.user?

      mainClasses = React.addons.classSet({
        'main': true
        'no-footer': @state.noFooter
      })

      <div className="container" >
        <IframeResizerScript />
        {if @state.showEnv
          <div className="environment">
            {@state.env} Stack
            <div className="close" onClick={=> @setState(showEnv: false)}></div>
          </div>
        }
        <div className={mainClasses}>
          <header className="main-header">
            <nav className="main-nav">
              <h1 className="logo">
                <a href="/#/"></a>
              </h1>
              {@props.children}
              {if context
                <UserInfo />
              }
            </nav>
          </header>
          {<Notice /> if context}
          {if context
            <Router.RouteHandler params={@props.params} />
          else
            <@props.splashContent />
          }
        </div>
        {unless @state?.noFooter
          <footer className="main-footer">
            <div className="legal">
              <ul>
                <li><TermsOfService /></li>
                <li><PrivacyPolicy /></li>
              </ul>
              <p>&copy; 2015 SAMSUNG. All Rights Reserved.</p>
            </div>
            <UserVoiceLink />
            <a className="blog-link" href="https://blog.samsungsami.io">Blog</a>
            <Modal visible={Bowser.browser.msie && Bowser.browser.version < 10}>
              IE9 support will be coming shortly. In the meantime, please use a current version of IE or Chrome, Firefox or Safari.
            </Modal>
          </footer>
        }
        <ga.Initializer />
      </div>
