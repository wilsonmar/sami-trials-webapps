module.exports = {
  properties:
    dtid:
      type: 'string'
      require: true
    name:
      type: 'string'
      require: true
      minLength: 5
      maxLength: 32
}
