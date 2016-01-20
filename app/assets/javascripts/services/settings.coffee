angular.module('collegiateRivals')

.factory 'SettingsFactory', ->

  home = 0
  away = 1
  time = 1
  sounds = true

  return {

#
#    save settings
    saveHomeTeam: (id) ->
      home = id

    saveAwayTeam: (id) ->
      away = id

    saveTime: (num) ->
      time = num

    saveSounds: (bool) ->
      sounds = bool

#
#    get settings
    getHomeTeam: ->
      return home

    getAwayTeam: ->
      return away

    getTime: ->
      return time

    getSounds: ->
      return sounds
  }