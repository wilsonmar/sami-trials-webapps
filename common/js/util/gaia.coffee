xhr = require("./xhr")
merge = require("./merge")

module.exports = (config) -> (options) ->
  headers = merge(
    options.headers || {},
    {
      "Authorization": "Bearer #{config.accessToken}"
      "Content-Type": "application/json"
    }
  )

  xhr(
    merge(options,
      {
        url: "#{config.gaiaRoot}#{options.path}"
        headers: headers
        data: (if (data = options.data)? then JSON.stringify(data))
      }
    )
  )

