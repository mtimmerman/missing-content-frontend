'use strict'

angular
  .module 'missingContentFrontendApp'
  .factory 'path', ['$location',
  ($location) ->
    isActive = (path) ->
      return $location.url is path

    {
      isActive: isActive
    }
  ]