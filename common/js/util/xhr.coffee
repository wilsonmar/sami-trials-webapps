Bacon = require("baconjs")
Qajax = require("qajax")

doOnError = (f) -> (stream) ->
  console.log("binding to #{stream}")
  stream.onError(f)
  stream

module.exports = (opts) ->
  Bacon.fromCallback (cb) ->
    Qajax(opts).then(Qajax.toJSON).then(
      (response) ->
        try
          opts.onResponse? && opts.onResponse()
          cb(response)
        catch error
          setTimeout((-> throw error), 0)
      (error) -> cb(new Bacon.Error(error))
    )
  .toProperty()