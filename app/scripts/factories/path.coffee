'use strict'

angular.module 'missingContentFrontendApp'
  .factory 'PathFactory', ['$location', 'SharedPreferencesService', ($location, SharedPreferencesService) ->
    isActive = (path) ->
      if $location.url() is path
        return true
      else if $location.url() is '/' + SharedPreferencesService.getLocale() + path
        return true
      else
        false

    # Public API here
    {
    isActive: isActive
    }
  ]