'use strict';

angular.module('website-environment-configuration', [])
  .constant('ENV', {
    name:'development',
    api:'http://missingcontentcrawler-mtimmerman.rhcloud.com/api',
    oauth:'http://missingcontentcrawler-mtimmerman.rhcloud.com',
    client_id:'missing-content-frontend-local',
    redirect:'http://localhost:9000'
  });