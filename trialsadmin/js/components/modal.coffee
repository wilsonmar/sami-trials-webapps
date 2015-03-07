React = require("react")

module.exports =
  React.createClass
    hide: (e)->
      if e.target == @refs.overlay.getDOMNode() or e.target.className == 'modal-close'
        @props.onClose?()

    render: ->
      return null unless @props.visible
      classes = 'modal-overlay'
      classes += " #{@props.className}" if @props.className?
      <div ref="overlay" onClick={@hide} className={classes}>
        <div className="modal-content">
          {if @props.onClose
            <div onClick={@hide} title="Close" className="modal-close"></div>
          }
          {@props.children}
        </div>
      </div>
