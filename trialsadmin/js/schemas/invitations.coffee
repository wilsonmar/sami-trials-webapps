singleInvitation =
  type: 'object'
  properties:
    email:
      type: 'string'
      format: 'email'
      required: true

module.exports = {
  properties: {
    administrators: {
      type: 'array'
      items: singleInvitation
    }
    participants: {
      type: 'array'
      items: singleInvitation
    }
  }
}
