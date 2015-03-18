'use strict'

angular
  .module 'missingContentFrontendApp'
  .controller 'NavCtrl', ['$scope', '$location', '$anchorScroll', 'SharedPreferencesService'
  ($scope, $location, $anchorScroll, SharedPreferencesService) ->
    $scope.navigateTo = (location) ->
      if $location.path() == '/' + SharedPreferencesService.getLocale() + '/'
        if $location.hash()
          $location.hash('')
      else
        $location.path('/' + SharedPreferencesService.getLocale() + '/')
      $location.hash(location)
      $anchorScroll()
  ]