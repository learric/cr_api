angular.module('services')

.factory 'ClockFactory', (SettingsFactory) ->

  gameClock = new FlipClock(gameClock, {
    countdown: true
  })

  gameClock.setTime(3)

  gameQuarter = 1

  gameState = 'gameplay.newplay'

  return {
    setGameClock: ->
      getTime = SettingsFactory.getTime()
      setTime = getTime * 60
      gameClock.setTime(3)

    getGameClock: ->
      return gameClock

    setQuarter: ->
      gameQuarter += 1

    getQuarter: ->
      return gameQuarter

    setState: (state) ->
      gameState = state

    getState: ->
      return gameState
  }