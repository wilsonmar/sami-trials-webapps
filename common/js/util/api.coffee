merge = require("../util/merge")
Bacon = require("baconjs")

objectToUrl = (object) ->
  Object.keys(object).map((k) ->
    if object[k]?
      if object[k] is Array
        value = object[k].join ','
      else
        value = encodeURIComponent object[k]
      encodeURIComponent(k) + '=' + value
  ).filter((v) -> v isnt undefined).join '&'

module.exports = ({gaia}) ->
  createTrial: (trial) ->
    gaia(
      method: "POST"
      path: "/trials"
      data: trial
    )

  DevicePin:
    update: (data)->
      gaia(
        method: "PUT"
        path: "/devices/registrations/pin"
        data: data
      )

    fetchStatus: (data)->
      gaia(
        method: "POST"
        path: "/devices/registrations/status"
        data: data
      )

  Trial: (trialId) ->
    fetch:
      gaia(
        method: "GET"
        path: "/trials/#{trialId}"
      ).map (r) -> r.data

    update: (trial) ->
      gaia(
        method: "PUT",
        path: "/trials/#{trialId}"
        data: trial
      )

    invitations: (status) ->
      gaia(
        method: "GET"
        path: "/trials/#{trialId}/invitations?status=#{status}"
      ).map (r) -> r.data.invitations

    admins:
      gaia(
        method: "GET"
        path: "/trials/#{trialId}/administrators"
      ).map (r) -> r.data.administrators

    exports: (cb) ->
      gaia(
        method: "GET"
        path: "/messages/export/history?trialId=#{trialId}"
        onResponse: cb
      ).map (r) -> r.data.exports

    export: (startDate, endDate, uids=null, sdtids=null, sdids=null,format=null) ->
      data =
          trialId: trialId
          startDate: startDate
          endDate: endDate
          uids: uids
          sdtids: sdtids
          sdids: sdids
          format:format
      gaia(
        method: "GET"
        path: "/messages/export?"+objectToUrl(data)
      ).map (r) -> r.data || r
    latestExport:
      gaia(
        method: "GET"
        path: "/messages/export/history?count=1&offset=0"
      ).map (r) -> r.data
    participantsPage: (count=1, offset=0) ->
      gaia(
        method: "GET"
        path: "/trials/#{trialId}/participants?count=#{count}&offset=#{offset}"
      )
    allParticipants: ->
      maxCount = 100

      impl = (offset, total) ->
        if total? and offset >= total
          Bacon.once([])
        else
          gaia(
            method: "GET"
            path: "/trials/#{trialId}/participants?count=#{maxCount}&offset=#{offset}"
          ).flatMapLatest (page) ->
            impl(offset + page.count, page.total).flatMapLatest (rest) ->
              page.data.participants.concat(rest)

      impl(0)
    devices:
      gaia(
        method: "GET"
        path: "/trials/#{trialId}/devices"
      ).map (r) -> r.data.devices

    deviceTypes:
      gaia(
        method: "GET"
        path: "/trials/#{trialId}/devicetypes"
      ).map (r) -> r.data.deviceTypes

    createInvite: (invite) ->
      gaia(
        method: "POST"
        path: "/trials/#{trialId}/invitations"
        data: invite
      )

    createDeviceType: (deviceType) ->
      gaia(
        method: "POST",
        path: "/trials/#{trialId}/devicetypes"
        data: deviceType
      )

    Invite: (inviteId) ->
      update: (invite) ->
        gaia(
          method: "PUT"
          path: "/trials/#{trialId}/invitations/#{inviteId}"
          data: invite
        )

      delete:
        gaia(
          method: "DELETE"
          path: "/trials/#{trialId}/invitations/#{inviteId}"
          data: {}
        )

    Participant: (participantId) ->
      devices:
        gaia(
          method: "GET",
          path: "/trials/#{trialId}/participants/#{participantId}/devices"
        ).map ({data}) -> data.devices

      delete:
        gaia(
          method: "DELETE"
          path: "/trials/#{trialId}/participants/#{participantId}"
          data: {}
        )

  User: (userId) ->
    trials: (role) ->
      gaia(
        method: "GET"
        path: "/users/#{userId}/trials?role=#{role}"
      ).map (r) -> r.data.trials

    TrialsPage: ({role, count, offset}) ->
      gaia(
        method: "GET"
        path: "/users/#{userId}/trials?role=#{role}&count=#{count}&offset=#{offset}"
      )

    applications:
      gaia(
        method: "GET"
        path: "/users/#{userId}/applications"
      ).map (r) -> r.data.applications

    deviceTypes:
      gaia(
        method: "GET"
        path: "/users/#{userId}/devicetypes"
      ).map (r) -> r.data.deviceTypes

    devices:
      gaia(
        method: "GET"
        path: "/users/#{userId}/devices"
      ).map (r) -> r.data.devices

    connectDevice: (deviceType) ->
      gaia(
        method: "POST",
        path: "/devices",
        data:
          dtid: deviceType.id || deviceType.dtid
          name: deviceType.name
          uid: userId
      )

    updateDevice: (device) ->
      gaia(
        method: "PUT",
        path: "/devices/#{device.id}",
        data:
          name: device.name
          uid: userId
      )


    createDeviceType: (deviceType) ->
      gaia(
        method: "POST",
        path: "/devicetypes",
        data: merge(deviceType, {uid: userId})
      )

    applications:
      gaia(
        method: "GET"
        path: "/users/#{userId}/applications"
      ).map (r) -> r.data.applications

    createApplication: (application) ->
      gaia(
        method: "POST"
        path: "/applications"
        data: merge(application, {uid: userId})
      )

    DeviceType: (deviceTypeId) ->
      update: (deviceType) ->
        gaia(
          method: "PUT",
          path: "/devicetypes/#{deviceTypeId}",
          data: merge(deviceType, {uid: userId})
        )

    Application: (applicationId) ->
      update: (application) ->
        gaia(
          method: "PUT"
          path: "/applications/#{applicationId}"
          data: merge(application, {uid: userId})
        )

    Trial: (trialId) ->
      createDevice: (device) ->
        gaia(
          method: "POST",
          path: "/trials/#{trialId}/participants/#{userId}/devices",
          data: device
        )

      devices:
        gaia(
          method: "GET"
          path: "/trials/#{trialId}/participants/#{userId}/devices"
        ).map (r) -> r.data.devices

      Device: (deviceId) ->
        disconnect:
          gaia(
            method: "DELETE"
            path: [
              "/trials/#{trialId}"
              "/participants/#{userId}"
              "/devices/#{deviceId}"
            ].join('')
            data: {}
          )

  allDeviceTypes: ->
    maxCount = 100

    impl = (offset, total) ->
      if total? and offset >= total
        Bacon.once([])
      else
        gaia(
          method: "GET"
          path: "/devicetypes?count=#{maxCount}&offset=#{offset}"
        ).flatMapLatest (page) ->
          impl(offset + page.count, page.total).flatMapLatest (rest) ->
            page.data.deviceTypes.concat(rest)

    impl(0)

  DeviceType: (deviceTypeId) ->
    fetch:
      gaia(
        method: "GET"
        path: "/devicetypes/#{deviceTypeId}"
      ).map (r) -> r.data

    publish:
      gaia(
        method: "POST"
        path: "/devicetypes/#{deviceTypeId}/publish"
        data: {}
      )

    delete:
      gaia(
        method: "DELETE"
        path: "/devicetypes/#{deviceTypeId}"
        data: {}
      )

    manifests:
      gaia(
        method: "GET"
        path: "/devicetypes/#{deviceTypeId}/manifestversionhistory"
      ).map (r) -> r.data.manifests

    devices:
      gaia(
        method: "GET"
        path: "/devices/devicetypes/#{deviceTypeId}"
      ).map (r) -> r.data.devices

    createManifest: (manifest) ->
      gaia(
        method: "POST",
        path: "/devicetypes/#{deviceTypeId}/manifests",
        data: manifest
      )

    Manifest: (manifestId) ->
      setStatus: (status) ->
        gaia(
          method: "POST",
          path: "/devicetypes/#{deviceTypeId}/manifests/#{manifestId}/status",
          data: {status: status}
        )

  Device: (deviceId) ->
    createToken:
      gaia(
        method: "PUT"
        path: "/devices/#{deviceId}/tokens"
        data: {}
      )

    token:
      gaia(
        method: "GET",
        path: "/devices/#{deviceId}/tokens",
      )

    deleteToken:
      gaia(
        method: "DELETE"
        path: "/devices/#{deviceId}/tokens"
        data: {}
      )

    disconnect:
      gaia(
        method: "DELETE"
        path: "/devices/#{deviceId}"
        data: {}
      )

  Application: (applicationId) ->
    fetch:
      gaia(
        method: "GET"
        path: "/applications/#{applicationId}"
      ).map (r) -> r.data

    delete:
      gaia(
        method: "DELETE"
        path: "/applications/#{applicationId}"
        data: {}
      )

  SimbandDeviceType:
    gaia(
      method: "GET"
      path: "/devicetypes/simband"
    ).map (r) -> r.data

  DeviceHistory: (sdids) ->
    gaia(
      method: "GET"
      path: "/historical/normalized/messages/last?sdids=#{sdids.join(',')}&count=1"
    ).map ({data}) -> data
