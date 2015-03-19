'use strict'

angular.module 'missingContentFrontendApp'
  .factory 'path', ['$location', 'SharedPreferences', ($location, SharedPreferences) ->
    isActive = (path) ->
      if $location.url() is path
        return true
      else if $location.url() is '/' + SharedPreferences.getLocale() + path
        return true
      else
        false

    # Public API here
    {
      isActive: isActive
    }
  ]