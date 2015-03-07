emails = (str) -> str.split(",").map((s) -> s.trim()).filter((s) -> s.length > 0)

module.exports =
  {
    participants: {
      to: (str) -> emails(str).map (email) -> {email, invitationType: "participant"}
    }
    administrators: {
      to: (str) -> emails(str).map (email) -> {email, invitationType: "administrator"}
    }
  }
