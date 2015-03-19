'use strict'

angular
  .module 'missingContentFrontendApp'
  .controller 'LoginCtrl', ['$scope', '$http', '$location', 'AccessToken', 'SharedPreferences',
  ($scope, $http, $location, AccessToken, SharedPreferences) ->
    hash = $location.path().substr(1)
    AccessToken.setTokenFromString(hash)
    $http.defaults.headers.common['Authorization'] = 'bearer ' + AccessToken.get().access_token
    $http.defaults.headers.common['Content-Type'] = 'application/json'

    $location.path('/' + SharedPreferences.getLocale() + '/')
    $location.replace()
]
