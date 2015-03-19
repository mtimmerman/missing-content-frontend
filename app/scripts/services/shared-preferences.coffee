'use strict'

angular
  .module 'missingContentFrontendApp'
  .service 'SharedPreferences', ['$cookieStore', '$translate',
  ($cookieStore, $translate) ->
    if $cookieStore.get 'locale'?
      $translate.use $cookieStore.get 'locale'

    setLocale: (locale) ->
      $cookieStore.put 'locale', locale
      $translate.use locale

    getLocale: ->
      $cookieStore.get 'locale'

    extractLocaleFromURL: (url) ->
      if url.indexOf 'nl' > 0
        return 'nl'
      if url.indexOf 'fr' > 0
        return 'fr'
      if url.indexOf 'en' > 0
        return 'en'
  ]