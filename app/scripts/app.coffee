'use strict'

###*
 # @ngdoc overview
 # @name missingContentFrontendApp
 # @description
 # # missingContentFrontendApp
 #
 # Main module of the application.
###
angular
  .module 'missingContentFrontendApp', [
    'ngAnimate'
    'ngCookies'
    'ngRoute'
    'ngSanitize'
    'ngTouch'
    'angularLoad'
    'oauth'
    'website-environment-configuration'
    'pascalprecht.translate'
    'angularSmoothscroll'
    'ui.bootstrap'
  ]
  .config ['$routeProvider', '$httpProvider', '$translateProvider', '$locationProvider',
    ($routeProvider, $httpProvider, $translateProvider, $locationProvider) ->
      supportedLanguages = ['nl', 'fr', 'en']


      $httpProvider.interceptors.push('httpInterceptor')
      $locationProvider.html5Mode(false).hashPrefix('!')

      baseRoutes = [
        {
          route: '/'
          templateUrl: 'views/main.html'
          controller: 'MainCtrl'
        },
        {
          route: '/about'
          templateUrl: 'views/about.html'
          controller: 'AboutCtrl'
        }
      ]

      # Build all urls
      routes = []
      for locale in supportedLanguages
        for route in baseRoutes
          tmpRoute = {};
          tmpRoute.route = '/' + locale + route.route
          tmpRoute.templateUrl = route.templateUrl
          tmpRoute.controller = route.controller
          tmpRoute.useOldDesign = route.useOldDesign
          routes.push tmpRoute

      for route2 in baseRoutes
        if route2.route.length > 1 then routes.push route2

      # Edit in login.coffee too
      routes.push {
        route: '/&access_token=:accessToken'
        templateUrl: 'views/loyalty.html'
        controller: 'LoginCtrl'
      }

      for route in routes
        $routeProvider.when route.route, {
          templateUrl: route.templateUrl
          controller: route.controller
          useOldDesign: route.useOldDesign
        }

      $routeProvider.otherwise
        redirectTo: '/nl'

      $translateProvider.useStaticFilesLoader({
        prefix: 'i18n/locale-',
        suffix: '.json'
      });

      $translateProvider.preferredLanguage 'nl'
  ]
  .run ['$rootScope', '$location', '$anchorScroll', 'ENV', 'AccessToken', 'path', 'angularLoad',
        'localizedUrls', 'SharedPreferences', '$cookieStore',
  ($rootScope, $location, $anchorScroll, ENV, AccessToken, path, angularLoad, localizedUrls, SharedPreferences,
   $cookieStore) ->

    $rootScope.$on '$routeChangeStart', (e, next, current) ->
      # localization check
      if !$cookieStore.get('locale')
        SharedPreferences.setLocale('nl')
        return
      else
        SharedPreferences.setLocale($cookieStore.get('locale'))
        return

    # global authentication check
    AccessToken.get()

    # current user access
    $rootScope.currentUser = {};

    # authentication checks

    $rootScope.isAuthenticated = AccessToken.get()?
    $rootScope.oauth_site = ENV.oauth
    $rootScope.oauth_client_id = ENV.client_id
    $rootScope.oauth_redirect = ENV.redirect

    $rootScope.$on 'oauth:logout', ->
      if $rootScope.isAuthenticated
        $location.path '/'
        $location.hash ''
        $rootScope.isAuthenticated = false

    $rootScope.$on 'oauth:authorized', ->
      $rootScope.accessToken = AccessToken.get().access_token
      $rootScope.isAuthenticated = true

    $rootScope.isPathActive = path.isActive

    scrollTo = () ->
      if $location.hash()
        # Call anchorscoll fast for fast response
        $timeout ->
          $anchorScroll()
        , 100
        # Call anchorscroll second time slow for when page rendering takes a while
        $timeout ->
          $anchorScroll()
        , 1000
    $rootScope.$on '$viewContentLoaded', () ->
      scrollTo()
    $rootScope.$on '$routeChangeSuccess', () ->
      scrollTo()
    $rootScope.$on '$includeContentLoaded', () ->
      scrollTo()

    $(document).ready ->
      $("body").tooltip({ selector: '[data-toggle=tooltip]' })
      return
  ]