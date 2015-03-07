Bacon = require("baconjs")

module.exports = (config) ->
  {accountsUrl, simbaUrl, yourAccountUrl, accessToken, logoutUrl, gaiaRoot, analyticsBus} = config

  gaia = require("./gaia")(config)
  user = require("./user")(gaia)
  userId = user.map ({id}) -> id

  resources = require("./resources")({userId, gaia})

  noticeBus = new Bacon.Bus
  hideFooterBus = new Bacon.Bus

  api = require("./api")({userId, gaia})

  {
    user,
    userId,
    gaia,
    resources,
    noticeBus,
    accountsUrl,
    logoutUrl,
    simbaUrl,
    yourAccountUrl,
    accessToken,
    gaiaRoot,
    analyticsBus,
    api,
    hideFooterBus
  }
