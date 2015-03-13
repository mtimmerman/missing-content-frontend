'use strict'

###*
 # @ngdoc function
 # @name missingContentFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the missingContentFrontendApp
###
angular
  .module 'missingContentFrontendApp'
  .controller 'MainCtrl', ($scope, localStorageService) ->
    accessToken = localStorageService.get 'accessToken'

    $scope.accessToken = accessToken

    $scope.$watch 'accessToken', ->
      localStorageService.set 'accessToken', $scope.accessToken
    , true

    $scope.$on 'oauth:login', (event, token) ->
      console.log 'yo'
      $scope.accessToken = token.access_token

    $scope.$on 'oauth:logout', (event) ->
      $scope.accessToken = null;
