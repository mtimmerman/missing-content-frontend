'use strict'

###*
 # @ngdoc function
 # @name missingContentFrontendApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the missingContentFrontendApp
###
angular.module('missingContentFrontendApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
