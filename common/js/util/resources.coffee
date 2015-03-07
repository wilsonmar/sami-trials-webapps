MANIFEST = "import com.samsung.sami.manifest.Manifest\r\nimport com.samsung.sami.manifest.fields.Field\r\nimport com.samsung.sami.manifest.fields.FieldDescriptor\r\npublic class SamsungCamManifest implements Manifest {\r\n@Override\r\nList<Field> normalize(String input) {\r\nreturn []\r\n}\r\n@Override\r\nList<FieldDescriptor> getFields() {\r\nreturn []\r\n}\r\n}"

module.exports = ({gaia, userId}) ->
  deviceTypes = userId.flatMapLatest (userId) ->
    gaia(
      method: "GET",
      path: "/users/#{userId}/devicetypes?includeShared=true"
    ).map (r) -> r.data.deviceTypes
  .toProperty()

  window.addSampleDeviceType = ->
    userId.take(1).flatMap (userId) ->
      gaia(
        method: "POST",
        path: "/devicetypes"
        data: {
          "uid": userId,
          "name": "Sandwiches",
          "uniqueName": "com.samsung.web.sandwiches",
          "manifest": MANIFEST
        }
      )
    .onValue -> console.log("added dummy device type")




  {
    deviceTypes
  }