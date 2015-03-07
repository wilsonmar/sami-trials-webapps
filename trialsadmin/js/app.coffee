window.bootStrap = (args) ->
  app = require("./trials_core")(args)
  splashScreen = require("./handlers/trials_landing")
  require("../common-js/boot/app")({app, splashScreen, appName: "trials"})(args)

window.doAuth = require("../common-js/boot/auth")
