'use strict'

angular.module('missingContentFrontendApp')
.factory 'TVShow', ['$q', '$http', 'Api', 'AccessToken', ($q, $http, Api, AccessToken) ->
  class Card
    constructor: (@pk, @theTVDbName, @plexName, @plexKey, @episodesMissing) ->

    @all: () ->
      deferred = $q.defer()

      request = $http.post Api.tvsh.all, {}

      request.then (result) =>
        cards_data = result.data.content

        cards = if cards_data.length > 0 then [] else undefined

        for card_data in cards_data
          card_is_blocked = if card_data.state is 'active' then false else true
          card_type = if card_data.forDevice then 'digital' else 'physical'
          cards.push new Card('1', card_data.code, card_data.serialNumber, card_type, card_is_blocked)

        deferred.resolve(cards)

      request.error (data, status) ->
        console.log data
        console.log status

      return deferred.promise