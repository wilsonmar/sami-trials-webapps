React = require("react")

module.exports =
  React.createClass
    mixins: [React.addons.LinkedStateMixin]

    getInitialState: ->
      showOptions: false
      options: @props.options

    componentDidUpdate: (prevProps, prevState)->
      return if prevState.selectedIndex == @state.selectedIndex
      node = @refs.options.getDOMNode()
      node.scrollTop = if (index = @state.selectedIndex) is -1
        0
      else
        index * 41

    keyPress: (e)->
      keyUp = 38
      keyDown = 40
      index = @state.selectedIndex
      options = @filteredOptions()

      state = switch e.keyCode
        when 13
          @choseValue options[index].value
          e.preventDefault()
        when keyUp
          e.preventDefault()
          selectedIndex: index - 1 unless index == -1
        when keyDown
          e.preventDefault()
          selectedIndex: index + 1 if index+1 < options.length
        else
          selectedIndex: -1

      @setState state if state

    showOpts: (e) -> @setState showOptions: true, selectedIndex: -1
    hideOpts: (e) -> @setState showOptions: false
    delayHideOpts: -> setTimeout @hideOpts, 500

    choseValue: (value)->
      newValue = @props.onSelect?(value)
      @props.valueLink?.requestChange(newValue) if newValue && newValue != value
      @setState value: newValue || value, showOptions: false

    choose: (e) -> @choseValue(e.target.dataset.value)

    filteredOptions: ->
      value = @state.value || ""
      @state.options.filter (o)->
        o.value.toLowerCase().indexOf(value.toLowerCase()) is 0

    render: ->
      options = @filteredOptions()
      optionsClasses = React.addons.classSet(
        'custom-select-options' : true
        'open': @state.showOptions && options.length > 0
      )

      linkState =
        value: @state.value
        requestChange: (value) =>
          @props.valueLink?.requestChange(value)
          @setState value: value

      <div className="custom-select" tabIndex="0" onKeyDown={@keyPress} onFocus={@showOpts} onBlur={@hideOpts}>
        <input
          tabIndex="-1"
          type="text"
          name={@props.name}
          valueLink={linkState} />

        <ul className={optionsClasses} ref="options" >
          {for option, index in options
            classes = React.addons.classSet(
              'custom-select-option' : true
              'selected' : @state.selectedIndex == index
            )
            <li onClick={@choose} className={classes} data-index={index} data-value={option.value}>
              {option.title || option.value}</li>
          }

          {if @state.options.length == 0
            <li className="no-results">No results match "{@state.value}"</li>
          }
        </ul>
      </div>
