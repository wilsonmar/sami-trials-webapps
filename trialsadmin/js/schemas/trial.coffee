invitations = require("../schemas/invitations")

module.exports =
  properties: {
    name: {
      type: 'string'
      minLength: 2
      maxLength: 50
      required: true
    }
    description: {
      type: 'string'
      minLength: 2
      maxLength: 255
      required: true
    },
    devicetypes: {
      type: 'array',
      item: {
        type: "object"
        properties: {
          dtid: { type: "string" }
        }
      }
    }
    administrators: invitations.properties.administrators
    participants: invitations.properties.participants
  }
