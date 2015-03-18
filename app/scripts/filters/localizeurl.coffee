angular.module('missingContentFrontendApp')
.filter 'LocalizeUrlFilter', [ 'SharedPreferencesService', (SharedPreferencesService) ->
  (input) ->
    if !input
      return '/' + SharedPreferencesService.getLocale()
    else
      return '/' + SharedPreferencesService.getLocale() + input


]