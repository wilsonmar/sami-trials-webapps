React = require("react")
{BaconMixin} = require("react-bacon")

module.exports = (hideFooterBus)->
  React.createClass
    mixins: [BaconMixin]

    getInitialState: ->
      headerHeight: 114
      windowHeight: window.innerHeight

    render: ->
      <div className="back-frame">
        <div className="frame-heading">
          <a href={@props.backUrl} onClick={-> hideFooterBus.push(false)} className="frame-back">{@props.backText}</a>
          <div className="frame-title">
            {@props.children}
          </div>
        </div>
        <iframe ref="iframe" id="popupIFrame" src={@props.src} width="100%" height={@state.windowHeight - @state.headerHeight} frameBorder="0" scrolling="no"></iframe>
      </div>

    componentDidMount: ->
      window.iFrameResize?({}, '#popupIFrame')
      window.addEventListener('resize', @handleResize)
      hideFooterBus.push(true)
      @handleResize()

    handleResize: ->
      if env = document.querySelector('.environment')
        offsetHeight = env.offsetHeight
      else
        offsetHeight = 0

      @setState(
        windowHeight: window.innerHeight
        headerHeight: 114 + offsetHeight
      )

    componentWillUnmount: ->
      window.removeEventListener('resize', @handleResize)
