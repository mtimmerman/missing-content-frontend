'use strict'

###*
 # @ngdoc function
 # @name missingContentFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the missingContentFrontendApp
###
angular.module('missingContentFrontendApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
