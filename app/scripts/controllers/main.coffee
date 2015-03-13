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

    $scope.addTodo = () ->
      $scope.todos.push $scope.todo
      $scope.todo = ''

    $scope.removeTodo = (index) ->
      $scope.todos.splice(index, 1)
