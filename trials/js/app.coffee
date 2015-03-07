window.bootStrap = (args) ->
  app = require("./trial_participants_core")
  splashScreen = require("./handlers/trial_participants_landing")
  require("../common-js/boot/app")({app, splashScreen, appName: "trial_participants"})(args)

window.doAuth = require("../common-js/boot/auth")
