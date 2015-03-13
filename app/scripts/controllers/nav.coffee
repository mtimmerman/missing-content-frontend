'use strict'

angular
  .module 'missingContentFrontendApp'
  .controller 'NavCtrl', ['$scope', '$location', '$anchorScroll'
  ($scope, $location, $anchorScroll) ->
    $scope.navigateTo = (location) ->
      if $location.path == '/'
        if $location.hash()
          $location.hash('')
      else
        $location.path('/')

      $location.hash(location)

      $anchorScroll()
  ]