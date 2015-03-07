React = require("react/addons")
revalidator = require("revalidator")
Bacon = require("baconjs")
Immutable = require("immutable")
{BaconMixin} = require("react-bacon")
Chosen = require("./chosen")
CustomSelect = require("./custom_select")
merge = require("../util/merge")

identity = (x) -> x

flatten = (a) -> a.reduce((a,b) -> a.concat(b)) || []

# creates the unholy triad of form submission and validation.

module.exports = ({initialData, schema, onSubmit, codecs}) ->
  initialData ||= {}
  codecs ||= {}
  changeBus = new Bacon.Bus
  submittedBus = new Bacon.Bus

  haveSubmitted = submittedBus.toProperty(false)

  maxLengths = Object.keys(schema.properties).reduce((m, k) ->
    if maxLength = schema.properties[k]?.maxLength
      m.set(k, maxLength)
    else
      m
  , Immutable.Map({})).toJS()

  validate = (v) -> revalidator.validate(v, schema)

  values = changeBus.scan Immutable.Map(initialData), (m, [k, v]) ->
    encode = codecs[k]?.to || identity
    m.set(k,encode(v))

  values.onValue (v) -> #  console.log(v.toJS())# rrr

  serverErrorsBus = new Bacon.Bus
  serverErrors = serverErrorsBus.toProperty(false)

  validation = Bacon.combineTemplate({values, haveSubmitted, serverErrors}).map ({values, haveSubmitted, serverErrors}) ->
    if serverErrors
      {
        valid: false
        errors: serverErrors.map ({field, message}) ->
          {property: field, attribute: field, message}
      }
    else if haveSubmitted
      validate(values.toJS())
    else
      {errors: []}


  submit = (evt) =>
    evt.preventDefault() if evt
    values.map((m) -> m.toJS()).take(1).onValue (v) =>
      submittedBus.push(true)
      if validate(v).valid
        result = onSubmit?(v)
        if result instanceof Bacon.Observable
          result.take(1).onValue (result) ->
            if (success = result.success)?
              success()
            else if (errors = result.errors)?
              errors = flatten(errors) # wtf, why?
              serverErrorsBus.push(errors)




  Form = React.createClass
    statics:
      submit:-> submit()
    render: ->
      <form onSubmit={submit}>
        {@props.children}
      </form>


  changedInput = (element) ->
    node = element.getDOMNode()
    changeBus.push([node.name, node.value])

  validationFor = (name) ->
    validation.map ({errors}) ->
      errors.filter (error) -> error.property.split('.')[0] == name

  getDefault = (key) ->
    encodedInitial = initialData[key]
    (codecs[key]?.from || identity)(encodedInitial) if encodedInitial?


  input = (mkElem) -> React.createClass
    componentWillMount: ->
      if v = @props.defaultValue
        initialData[@props.name] = v
        changeBus.push [@props.name, v]

    onChange: (e)->
      changedInput(@)
      @props.valueLink?.requestChange(e.target.value)

    render: ->
      props = {onChange: @onChange, valueLink: null}

      if @props.type in ["radio", "checkbox"]
        props['defaultChecked'] = getDefault(@props.name) == @props.value
      else
        props['defaultValue'] = getDefault(@props.name)

      mkElem(merge(@props, props))

  Input = input(React.DOM.input)

  TextArea = input(React.DOM.textarea)

  Select = React.createClass
    componentWillMount: ->
      if @props.options?.length > 0
        v = @props.options[0].id
        initialData[@props.name] = v
        changeBus.push [@props.name, v]

    render: ->
      defaultValue = getDefault(@props.name)
      handleChange = (v) => changeBus.push([@props.name, v])
      valueLink =
        value: defaultValue,
        requestChange: (value) ->
          valueLink.value = value
          handleChange(value)

      <select {...@props} valueLink={valueLink}>
        {@props.options.map ({id, name}) ->
          <option key={id} value={id}>{name}</option>
        }
      </select>

  ChosenInput = React.createClass
    componentWillReceiveProps: (nextProps)->
      if @props.valueLink? && @props.valueLink.value != nextProps.valueLink.value
        value = nextProps.valueLink.value
        @handleChange value

    handleChange: (v)->
      changeBus.push([@props.name, v])
      @props.valueLink?.requestChange(v)
      @props.onChoose?(v)

    render: ->
      {onlyAllowAppend} = @props
      defaultValue = @props.defaultValue || getDefault(@props.name)

      valueLink =
        value: defaultValue
        requestChange: (value) =>
          valueLink.value = value
          @handleChange(value)

      disabledValues = if @props.multiple and onlyAllowAppend
        defaultValues = defaultValue.reduce(
          (m, k) -> m.add(k),
          Immutable.Set.empty()
        )
      else
        Immutable.Set.empty()

      <Chosen {...@props} valueLink={valueLink}>
        {unless defaultValue
          <option value="-1"></option>
        }
        {@props.options.map ({id, name}) ->
          <option disabled={disabledValues.has(id)} key={id} value={id}>{name}</option>
        }
      </Chosen>

  SearchInput = React.createClass
    handleChange: (v)->
      changeBus.push([@props.name, v])
      @props.valueLink?.requestChange(v)

    render: ->
      valueLink =
        value: @props.valueLink.value
        requestChange: (value) =>
          valueLink.value = value
          @handleChange(value)

      <CustomSelect {...@props} valueLink={valueLink} />

  ValidationFor = React.createClass
    mixins: [BaconMixin]
    render: ->
      errors = @state?.error || []
      classes = React.addons.classSet(
        'error': errors.length > 0
      )
      <div className={classes}>
        {@props.children}
        <div className="errors">
          {
            errors.map (error) ->
              <span key="{error.attribute}">{error.message}</span>
          }
        </div>
      </div>
    componentWillMount: ->
      @plug(validationFor(@props.name), "error")

  RemainingText = require("./remaining_text")({values, maxLengths})

  setValue = (key) -> (value) -> changeBus.push([key,value])

  Inputs = {
    Input: Input,
    TextArea: TextArea,
    Chosen: ChosenInput,
    Select: Select,
    Search: SearchInput
  }

  {
    Form, Inputs, ValidationFor, RemainingText, setValue, getDefault
  }


