"use strict"

Yoi = require "yoi"

class Cron extends Yoi.Cron 

  counter = 0

  execute: ->
    counter++
    console.log " [cron] #{counter}"

exports = module.exports = Cron
