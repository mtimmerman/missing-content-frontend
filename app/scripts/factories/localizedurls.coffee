'use strict'

angular
  .module 'missingContentFrontendApp'
  .factory 'localizedUrls', ['$rootScope', '$translate', 'SharedPreferences',
  ($rootScope, $translate, SharedPreferences) ->
    isFoundIn = (term, array) ->
      array.indexOf term isnt -1

    supportedLanguages = ['/nl', '/fr', '/en']

    $rootScope.$on '$routeChangeSuccess', (event, route) ->
      langPath = route?.$$route?.originalPath?.substring(0, 3);
      if langPath && isFoundIn langPath, supportedLanguages
        $translate.use langPath.substring(1, 3)
        SharedPreferences.setLocale(langPath.substring(1, 3))
      return true

    return {
    }
  ]