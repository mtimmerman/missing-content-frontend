angular.module( 'missingContentFrontendApp' )
.factory 'Api', [ '$http', 'ENV', ( $http, ENV ) ->
  new class Api
    constructor: ->
      endpoint_base = ENV.api

      @tvshows =
        all: endpoint_base + '/api/tvshows'
        get: endpoint_base + '/api/tvshows/{id}'
        seasons: endpoint_base + '/api/tvshows/{id}/seasons'
        episodes: endpoint_base + '/api/tvshows/{id}/episodes'
        episodesNotOnPlex: endpoint_base + '/api/tvshows/{id}/episodes-not-on-plex'

      @seasons =
        all: endpoint_base + '/api/seasons'
        get: endpoint_base + '/api/seasons/{id}'
        episodes: endpoint_base + '/api/seasons/{id}/episodes'
        episodesNotOnPlex: endpoint_base + '/api/seasons/{id}/episodes-not-on-plex'

      @episodes =
        all: endpoint_base + '/api/episodes'
        get: endpoint_base + '/api/episodes/{id}'
        notOnPlex: endpoint_base + '/api/episodes/not-on-plex'

      @crawlerInfos =
        all: endpoint_base + '/api/crawlerinfos'
        get: endpoint_base + '/api/crawlerinfos/{id}'

      @artists =
        all: endpoint_base + '/api/artists'
        get: endpoint_base + '/api/artists/{id}'
        albums: endpoint_base + '/api/artists/{id}/albums'
        albumsNotOnPlex: endpoint_base + '/api/artists/{id}/albums-not-on-plex'

      @albums =
        all: endpoint_base + '/api/albums'
        get: endpoint_base + '/api/albums/{id}'
        notOnPlex: endpoint_base + '/api/albums/{id}/not-on-plex'
]
