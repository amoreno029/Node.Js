"use strict"

Yoi       = require "yoi"

module.exports = -> 

  tasks = []
  tasks.push _setName(user) for user in test.users
  tasks

# Private methods
_setName = (user) -> ->
  Yoi.Test "GET", "api", user, null, "Set #{user.name} for parameter 'name'", 200 
