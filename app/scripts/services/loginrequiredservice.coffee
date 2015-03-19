'use strict'

angular
  .module 'missingContentFrontendApp'
  .service 'Loginrequiredservice', ['$rootScope', '$location',
  ($rootScope, $location) ->
    class Loginrequiredservice
      @check: ->
        if !$rootScope.isAuthenticated
          $location.path('/')
  ]