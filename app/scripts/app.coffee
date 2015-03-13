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
    'ngResource'
    'ngRoute'
    'ngSanitize'
    'ngTouch'
    'ui.sortable'
    'LocalStorageModule'
    'oauth'
    'website-environment-configuration'
  ]
  .config ['$routeProvider', 'localStorageServiceProvider', '$locationProvider'
    ($routeProvider, localStorageServiceProvider, $locationProvider) ->
      supportedLanguages = ['nl', 'fr', 'en']

      localStorageServiceProvider.setPrefix 'ls'

      $locationProvider.html5Mode(true).hashPrefix('!')

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

      for route in baseRoutes
        $routeProvider.when route.route, {
          templateUrl: route.templateUrl
          controller: route.controller
        }

      $routeProvider.otherwise
        redirectTo: '/'
  ]
  .run ['$rootScope', '$location', 'AccessToken', '$cookieStore', 'ENV', 'path', '$anchorScroll'
  ($rootScope, $location, AccessToken, $cookieStore, ENV, path, $anchorScroll) ->
    # global authentication check
    AccessToken.get()

    # current user access
    $rootScope.currentUser = {};

    # authentication checks
    $rootScope.isAuthenticated = AccessToken.get()?
    $rootScope.oauth_site = ENV.oauth
    $rootScope.oauth_client_id = ENV.client_id
    $rootScope.oauth_redirect = ENV.redirect

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