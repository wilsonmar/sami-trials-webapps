React = require("react")
window.jQuery = jQuery = require('jquery');
require("jquery-ui");
require("../vendor/jquery-ui-timepicker-addon");
Moment = require("moment")

module.exports =
  React.createClass
    selectedDatetime: null
    handleDatePickerChange: (timestamp)->
      #console.warn 'handle change', timestamp
      @selectedDatetime = timestamp
      @props.handleDatePickerChange?(@selectedDatetime)
      true
    getInitialState: ->
      date: @props.defaultDate
    componentDidMount: ->
      jQuery(this.refs.dp.getDOMNode()).datetimepicker
        minDate: new Date(2014, 0, 1)
        maxDate: new Date
        dateFormat: 'M d, yy'
        timeFormat: 'hh:mm:ss TT'
        pickerTimeFormat: 'hh:mm:ss TT'
        autoUpdateField: true
        showTime: false
        showOn: 'button'
        onClose: (inputText, dpInstance, tpInstance,event) =>
          # if was closed by apply button
          if jQuery(event.currentTarget).hasClass('ui-datepicker-close')
            @handleDatePickerChange dpInstance.input.datepicker('getDate')
      
      jQuery(this.refs.dc.getDOMNode()).on 'click', =>
        currentlyOpen = jQuery('#ui-datepicker-div:visible').length > 0
        if currentlyOpen
          jQuery(this.refs.dp.getDOMNode()).datetimepicker 'hide'
        else
          jQuery(this.refs.dp.getDOMNode()).datetimepicker 'show'
      @setDateTime()

    shouldComponentUpdate: (nextProps)->
      #update component just on defaultDate or inputId change
      (@props.defaultDate.getTime() != nextProps.defaultDate.getTime() or @props.inputId != nextProps.inputId)
    componentDidUpdate: ->
        @setDateTime()
        #console.warn 'update picker component', this.props.defaultDate
    setDateTime: ->
        jQuery(this.refs.dp.getDOMNode()).datetimepicker 'setDate', @props.defaultDate
        @selectedDatetime = @props.defaultDate.getTime()
        @updateDateTime()
    updateDateTime: ->
        #console.log('updateDateTime: '+@props.inputId+': '+Moment(@selectedDatetime).format('MMM DD'))
        jQuery(this.refs.dt.getDOMNode()).html(Moment(@selectedDatetime).format('MMM DD, YYYY'))
        jQuery(this.refs.tm.getDOMNode()).html(Moment(@selectedDatetime).format('hh:mm:ss A'))
    render: ->
        <div ref="dc" className='datepicker-container'>
            <input ref="dp" id={this.props.inputId} defaultDate={@props.defaultDate} />
            <span>
              <span ref="dt" className="dt"></span>
              <span ref="tm" className="tm"></span>
            </span>
            <span className='upArrow ui-state-default'>
              <span className="ui-icon ui-icon-triangle-1-n"></span>
            </span>
            <span className="downArrow  ui-state-default">
              <span className="ui-icon ui-icon-triangle-1-s"></span>
            </span>
        </div>