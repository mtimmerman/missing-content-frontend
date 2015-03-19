angular.module('missingContentFrontendApp')
.filter 'localizeUrl', [ 'SharedPreferences', (SharedPreferences) ->
  (input) ->
    if !input
      return '/' + SharedPreferences.getLocale()
    else
      return '/' + SharedPreferences.getLocale() + input


]