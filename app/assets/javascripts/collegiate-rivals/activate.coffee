angular.module('collegiateRivals', [
  'templates',
  'services',
  'controllers',
  'constants',
  'ngRoute',
  'ui.router',
  'ngCookies'
])

.config(($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise('/')

  $stateProvider

#
#  home states
  .state('home',
    url: '/'
    templateUrl: 'collegiate-rivals/index.html'
    controller: 'SessionController as session'
  )

#
#  menu states
  .state('menu',
    url: '/menu'
    templateUrl: 'collegiate-rivals/menu.html'
  )

#
#  settings states
  .state('settings',
    url: '/settings'
    templateUrl: 'collegiate-rivals/settings.html'
    controller: 'SettingsController as settings'
  )

  .state('settings.homeTeam',
    url: '/homeTeam'
    views: {
      'header': {
        template: '<h2>Choose Home Team</h2>'
      }
      'list': {
        template: '<ul class="team_selection_list"><home-team-choices></home-team-choices></ul>'
      }
    }
  )

  .state('settings.awayTeam',
    url: '/awayTeam'
    views: {
      'header': {
        template: '<h2>Choose Away Team</h2>'
      }
      'list': {
        template: '<ul class="team_selection_list"><away-team-choices></away-team-choices></ul>'
      }
    }
  )

  .state('settings.quarters',
    url: '/quarters'
    views: {
      'header': {
        template: '<h2>Choose Quarter Length</h2>'
      }
      'list': {
        template: '<quarter-choices></quarter-choices>'
      }
    }
  )

  .state('settings.questions',
    url: '/questions'
    views: {
      'header': {
        template: '<h2>Choose Question List</h2>'
      }
      'list': {
        template: '<ul class="opaque_box_selection_list"><question-choices></question-choices></ul>'
      }
    }
  )

  .state('settings.sounds',
    url: '/sounds'
    views: {
      'header': {
        template: '<h2>Sounds</h2>'
      }
      'list': {
        template: '<ul class="opaque_box_selection_list"><sound-choices></sound-choices></ul>'
      }
    }
  )

#
#  review settings state
  .state('review',
    url: '/review'
    templateUrl: 'collegiate-rivals/review.html'
    controller: 'ReviewController as review'
  )

#
#  cointoss states
  .state('cointoss',
    url: '/cointoss'
    templateUrl: 'collegiate-rivals/cointoss.html'
    controller: 'CointossController as cointoss'
  )

  .state('cointoss.choice',
    url: '/choice'
    views: {
      'header': {
        template: '<h2>Choice</h2>'
      }
      'buttons': {
        template: '<coinflip-buttons></coinflip-buttons>'
      }
    }
  )

  .state('cointoss.flip',
    url: '/flip'
    views: {
      'header': {
        template: '<h2>Flip</h2>'
      }
      'subheader': {
        template: '<p>{{ cointoss.awayTeam }} chooses {{cointoss.headsTails}}</p>'
      }
      'buttons': {
        template: '<button class="btn btn-primary" cointoss-button>Flip</button>'
      }
    }
  )

  .state('cointoss.result',
    url: '/result'
    views: {
      'header': {
        template: '<h2>Result</h2>'
      }
      'subheader': {
        template: '<span ng-show="cointoss.homeActive">{{cointoss.homeTeam.nickname}}</span><span ng-show="cointoss.awayActive">{{cointoss.awayTeam.nickname}}</span>'
      }
      'buttons': {
        template: '<button class="btn btn-primary" cointoss-button>Start</button>'
      }
    }
  )

#
#  gameplay states
  .state('gameplay',
    url: '/gameplay'
    templateUrl: 'collegiate-rivals/gameplay.html'
    controller: 'GameplayController as gameplay'
  )

  .state('gameplay.kickoff',
    url: '/kickoff'
    views: {
      'scoreboard': {
        template: 'Scoreboard'
      }
      'header': {
        template: 'Kickoff'
      }
      'buttons': {
        template: '<button class="btn btn-primary" ui-sref="gameplay.newplay">Kick</button>'
      }
    }
  )

  .state('gameplay.newplay',
    url: '/newplay'
    views: {
      'scoreboard': {
        template: 'Scoreboard'
      }
      'header': {
        template: 'New Play'
      }
      'buttons': {
        template: '<button class="btn btn-primary" ui-sref="question.ask">New</button>'
      }
    }
  )

#
#  question states
  .state('question',
    url: '/question'
    templateUrl: 'collegiate-rivals/question.html'
    controller: 'QuestionController as question'
  )

  .state('question.ask',
    url: '/ask'
    views: {
      'header': {
        template: '<h2>Ask Question</h2>'
      }
    }
  )

#
#  play states
  .state('play',
    url: '/play'
    templateUrl: 'collegiate-rivals/play.html'
    controller: 'PlaysController as plays'
  )

#
#  score states
  .state('score',
    url: '/score'
    templateUrl: 'collegiate-rivals/score.html'
    controller: 'ScoreController as score'
  )

  .state('score.confirm',
    url: '/confirm'
    views: {
      'header': {
        template: '<h2>Confirm</h2>'
      }
      'buttons': {
        template: '<div class="btn btn-success" touchdown-button>Touchdown</div> <a class="btn btn-warning" ui-sref="score.three" ng-click="score.setScores(3)">Field Goal</a> <a class="btn btn-danger" ui-sref="play">Back</a>'
      }
    }
  )

  .state('score.touchdown',
    url: '/touchdown'
    views: {
      'header': {
        template: '<h2>Touchdown</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.one" ng-click="score.setScores(1)">One Point</a> <a class="btn btn-primary" ui-sref="score.two" ng-click="score.setScores(2)">Two Point</a>'
      }
    }
  )

  .state('score.one',
    url: '/one'
    views: {
      'header': {
        template: '<h2>One Point</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.two',
    url: '/two'
    views: {
      'header': {
        template: '<h2>Two Points</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.three',
    url: '/three'
    views: {
      'header': {
        template: '<h2>Field Goal</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="score.kickoff">Kickoff</a>'
      }
    }
  )

  .state('score.kickoff',
    url: '/kickoff'
    views: {
      'header': {
        template: '<h2>Kickoff</h2>'
      }
      'buttons': {
        template: '<a class="btn btn-primary" ui-sref="gameplay.newplay">Kick</a>'
      }
    }
  )

#
#  interlude states
  .state('interlude',
    url: '/interlude'
    templateUrl: 'collegiate-rivals/interlude.html'
  )

#
#  outro states
  .state('outro',
    url: '/outro'
    templateUrl: 'collegiate-rivals/outro.html'
  )
)
