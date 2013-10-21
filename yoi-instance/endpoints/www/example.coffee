"use strict"
Yoi   = require "yoi"

module.exports = (server) ->
    server.get "/", (request, response, next) ->
      site = new Yoi.Site request, response
      bindings = 
        session: site.session
      site.template "index", bindings

    server.get "/login", (request, response, next) ->
      site = new Yoi.Site request, response
      bindings = 
        session: site.session
      site.template "index", bindings, "tapquo-rulz-since-2010"

    server.get "/logout", (request, response, next) ->
      site = new Yoi.Site request, response
      site.redirect "/", null
