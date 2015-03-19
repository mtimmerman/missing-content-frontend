angular
  .module 'missingContentFrontendApp'
  .factory 'httpInterceptor',
  ($q, $rootScope) ->
    request: (config) ->

      # intercept and change config: e.g. change the URL
      # config.url += '?nocache=' + (new Date()).getTime();
      # broadcasting 'httpRequest' event
      $rootScope.$broadcast "httpRequest", config
      config or $q.when(config)

    response: (response) ->

      # we can intercept and change response here...
      # broadcasting 'httpResponse' event
      $rootScope.$broadcast "httpResponse", response
      response or $q.when(response)

    requestError: (rejection) ->

      # broadcasting 'httpRequestError' event
      $rootScope.$broadcast "httpRequestError", rejection
      $q.reject rejection

    responseError: (rejection) ->

      # broadcasting 'httpResponseError' event
      $rootScope.$broadcast "httpResponseError", rejection
      $q.reject rejection
