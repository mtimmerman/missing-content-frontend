'use strict'

angular
  .module 'missingContentFrontendApp'
  .controller 'LoginCtrl', ['$scope', '$http', '$location', 'AccessToken', 'SharedPreferencesService',
  ($scope, $http, $location, AccessToken, SharedPreferencesService) ->
    hash = $location.path().substr(1)
    console.log 'ok'
    AccessToken.setTokenFromString(hash)
    $http.defaults.headers.common['Authorization'] = 'bearer ' + AccessToken.get().access_token
    $http.defaults.headers.common['Content-Type'] = 'application/json'

    $location.path('/' + SharedPreferencesService.getLocale() + '/')
    $location.replace()
]
