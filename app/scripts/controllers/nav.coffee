'use strict'

angular
  .module 'missingContentFrontendApp'
  .controller 'NavCtrl', ['$scope', '$location', '$anchorScroll', 'SharedPreferences'
  ($scope, $location, $anchorScroll, SharedPreferences) ->
    $scope.navigateTo = (location) ->
      if $location.path() == '/' + SharedPreferences.getLocale() + '/'
        if $location.hash()
          $location.hash('')
      else
        $location.path('/' + SharedPreferences.getLocale() + '/')
      $location.hash(location)
      $anchorScroll()
  ]