'use strict'

angular
  .module 'missingContentFrontendApp'
  .service 'LoginRequiredService', ['$rootScope', '$location',
  ($rootScope, $location) ->
    class Loginrequiredservice
      @check: ->
        if !$rootScope.isAuthenticated
          $location.path('/')
  ]