# largely derived from https://github.com/chenglou/react-chosen
# MIT licensed, copyright chenglou <chenglou92@gmail.com>

# === We need to get a jQuery instance into local scope without polluting global objects:
$ = require("jquery").noConflict(true) # load jQuery into current scope
window.jQuery = $ # attach it to the window
global.jQuery = $ if global?
require("drmonty-chosen") # let chosen attach itself to jQuery
delete window.jQuery # detach jQuery, with chosen attached to it, from window
delete global.jQuery if global?


React = require("react")

module.exports =
  React.createClass
    displayName: "Chosen"
    componentDidUpdate: ->
      $(@refs.select.getDOMNode()).trigger("chosen:updated")
    handleChange: (a,b,c) ->
      select = @refs.select.getDOMNode()
      value = if @props.multiple
        ([].filter.call select.querySelectorAll("option"), ({selected}) -> selected)
          .map ({value}) -> value
      else
        select.value
      (@props.onChange || @props.valueLink?.requestChange)?(value)
      @forceUpdate()

    componentDidMount: ->
      props = @props
      node = @refs.select.getDOMNode()

      $(node).removeData("chosen")

      $(node).chosen(
        allow_single_deselect: props.allowSingleDeselect,
        disable_search: props.disableSearch,
        disable_search_threshold: props.disableSearchThreshold,
        enable_split_word_search: props.enableSplitWordSearch,
        inherit_select_classes: props.inheritSelectClasses,
        max_selected_options: props.maxSelectedOptions,
        no_results_text: props.noResultsText,
        placeholder_text_multiple: props.placeholderTextMultiple,
        placeholder_text_single: props.placeholderTextSingle,
        search_contains: props.searchContains,
        single_backstroke_delete: props.singleBackstrokeDelete,
        width: props.width,
        display_disabled_options: props.displayDisabledOptions,
        display_selected_options: props.displaySelectedOptions
      )
      .on('chosen:maxselected', props.onMaxSelected)
      .change(@handleChange)

      # $(node).trigger("chosen:updated")
    componentWillUnmount: ->
      $(@refs.select.getDOMNode()).off('chosen:maxselected change')

    render: ->
      <div>
        <select {...@props} ref="select">{@props.children}</select>
      </div>




