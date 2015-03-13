'use strict'

###*
 # @ngdoc function
 # @name missingContentFrontendApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the missingContentFrontendApp
###
angular.module('missingContentFrontendApp')
  .controller 'MainCtrl', ($scope, localStorageService) ->
    todosInStore = localStorageService.get 'todos'

    $scope.todos = todosInStore || []

    $scope.$watch 'todos', ->
      localStorageService.set 'todos', $scope.todos
    , true

    accessToken = localStorageService.get 'accessToken'

    $scope.accessToken = accessToken

    $scope.$watch 'accessToken', ->
      localStorageService.set 'accessToken', $scope.accessToken
    , true

    $scope.addTodo = () ->
      $scope.todos.push $scope.todo
      $scope.todo = ''

    $scope.removeTodo = (index) ->
      $scope.todos.splice(index, 1)

    $scope.$on 'oauth:login', (event, token) ->
      console.log 'yo'
      $scope.accessToken = token.access_token

    $scope.$on 'oauth:logout', (event) ->
      $scope.accessToken = null;
