'use strict'

angular
  .module 'missingContentFrontendApp'
  .directive 'navigationHeader', ['$location', '$anchorScroll',
  ($location, $anchorScroll) ->
    templateUrl: 'views/directives/navigation-header.html'
    restrict: 'E'
    controller: 'NavCtrl'
    link: (scope, element, attrs) ->
      # Open/close menu when clicken menu buttons
      element.find('.navbar.toggle').on 'click', () ->
        element.find('#navbar-head').toggleClass 'navbar-navigation-is-open'

      # Close menu when clicking the logo, a menu item, or outside of it
      element.find('#navbar-head .navbar-brand, #navbar-head .navbar-navigation-navs a, #navbar-head .navbar-navigation-fade').on 'click', (event) ->
        element.find('#navbar-head').removeClass('navbar-navigation-is-open')
  ]

