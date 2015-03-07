Cookies = require('cookies-js')
url = require('url')
require('location-origin')

module.exports = ({token, appPath}) ->
  query = url.parse(window.location.href, true)?.query

  if query.status == 'profile_cancelled'
    returnPath = "##{query.state}"
  else
    returnPath = if window.location.search.indexOf('authorized') == -1
      Cookies.expire('accessToken')
      Cookies.set('accessToken', token) if token
      Cookies.get('returnPath') || ''
    else
      Cookies.get('deviceAuthReturnPath') || ''

    Cookies.expire('returnPath')
    Cookies.expire('deviceAuthReturnPath')

  # redirect to app
  window.location.href = (if window.location.pathname.indexOf("/auth") == 0 # yolo
    # we're running in our own domain
    "/"
  else
    appPath) + returnPath

