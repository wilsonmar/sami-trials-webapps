Cookies = require('cookies-js')

module.exports =
  setReturnUrl: ->
    Cookies.set('returnPath', window.location.hash)
