"use strict"

Yoi       = require "yoi"

module.exports = ->
  tasks = []

  tasks.push _new(item) for item in test.tasks
  tasks.push _update(test.tasks[2])
  tasks.push _delete(test.tasks[3])

  tasks


# Promises
# ==============================================================================
_new = (item) -> ->
  promise = new Yoi.Hope.Promise()
  Yoi.Test "POST", "api/task", item, null, "Se crea la tarea #{item.name}.", 200, (response) ->
    item.id = response.id
    promise.done null, response
  promise

_update = (item) -> ->
  Yoi.Test "PUT", "api/task", id: item.id, null, "Se cierra la tarea #{item.name}.", 200

_delete = (item) -> ->
  Yoi.Test "DELETE", "api/task", id: item.id, null, "Se borra la tarea #{item.name}.", 200