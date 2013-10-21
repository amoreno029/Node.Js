"use strict"
Yoi     = require "yoi"
# Models
Tasks   = require "../../commons/models/task"

module.exports = (server) ->

  server.post "/api/task", (request, response, next) ->
    rest = new Yoi.Rest request, response
    rest.required ["name"]
    Tasks.create(_parameters(rest)).then (error, tasks) ->
      if error then rest.badRequest() else rest.run tasks.parse()

  server.put "/api/task", (request, response, next) ->
    rest = new Yoi.Rest request, response
    rest.required ["id"]
    Yoi.Hope.shield([->
      Tasks.findId rest.parameter "id"
    , (error, @task) =>
      @task.finish()
    ]).then (error, value) ->
      if error? then rest.badRequest() else rest.successful()

  server.del "/api/task", (request, response, next) ->
    rest = new Yoi.Rest request, response
    rest.required ["id"]
    Yoi.Hope.shield([->
      Tasks.findId rest.parameter "id"
    , (error, @task) =>
      @task.delete(rest.parameter "id")
    ]).then (error, value) ->
      if error? then rest.badRequest() else rest.successful()

  server.get "/api/task", (request, response, next) ->
    rest = new Yoi.Rest request, response
    Tasks.findAll().then (error, value) ->
      if error
        rest.badRequest()
      else rest.run (val.parse() for val in value)


_parameters = (rest) ->
  name        : rest.parameter("name").trim()
  description : rest.parameter "description"
	