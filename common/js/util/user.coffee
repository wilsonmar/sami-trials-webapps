module.exports = (gaia) ->
  gaia(method: "GET", path: "/users/self").map ({data}) -> data