React = require("react")
Modal = require("../components/modal")

module.exports =
  React.createClass
    getInitialState: -> {}

    showPrivacy: (e)->
      e.preventDefault()
      @setState(showPrivacy: true)

    render: ->
      <div style={display: 'inline'}>
        <a href="#" onClick={@showPrivacy}>Privacy Policy</a>
        <Modal visible={@state.showPrivacy} onClose={=> @setState(showPrivacy: false)}>
          <header><h1>Privacy Policy</h1></header>
          <p><strong>Your Information.  Your Rights.  Our Responsibilities.</strong><br />
          <a href="http://developer.samsungsami.io/about/privacy.html">Learn More</a></p>

          <p>Samsung is committed to maintaining the privacy and security of your Personal Information, and we appreciate that medical information is particularly sensitive.  This Privacy Policy applies to the Samsung Simband/SAMIIO Platform, which includes any Samsung device, website or online application that refers or links to this Privacy Policy, the SAMIIO platform that will enable mobile devices like those based on Simband to upload information, and the following Samsung websites: developer.samsungsami.io, devportal.samsungsami.io, api.samsungsami.io, api.samsungsami.io/console, accounts.samsungsami.io, trial.samsungsami.io, and trial-admin.samsungsami.io (collectively, the "Platform").</p>

          <p>Any personal information that you provide when you use the Platform belongs to you and, in accordance with this Privacy Policy, we want you to understand how it may be collected, used and shared.</p>

          <p><strong>Information We Collect</strong><br />
          <a href="http://developer.samsungsami.io/about/privacy.html">Learn More</a></p>

          <p>We collect various types of information in connection with the Platform, including:</p>

          <ul>
            <li>Information you provide directly to us when you register to use a Website or obtain a Platform service;</li>
            <li>Information we collect about your use of the Platform; and</li>
            <li>Information that you upload from a Simband-based mobile device to the Platform.</li>
          </ul>

          <p>We may also seek your consent to collection of information not described in the Privacy Policy.</p>

          <p><strong>Use and Sharing of Information</strong><br />
          <a href="http://developer.samsungsami.io/about/privacy.html">Learn More</a></p>

          <p>We use the information we collect to, among other things:</p>

          <ul>
            <li>Provide the services you request; and</li>
            <li>Understand the way you use the services so that we can improve your experience.</li>
          </ul>

          <p>We also use the information we collect in ways described to you at the point of collection, or otherwise with your consent.</p>

          <p>Except as described in this Privacy Policy, we will not share your information with third parties.  However, we may share your information with:</p>

          <ul>
            <li>Service providers – companies that provide services for or on behalf of Samsung; and</li>
            <li>Law enforcement – when we are required to do so or to protect Samsung and our users.</li>
          </ul>

          <p><strong><a href="http://developer.samsungsami.io/about/privacy.html">Read full Privacy Policy</a></strong></p>
        </Modal>
      </div>
