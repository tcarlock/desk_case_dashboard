app = angular.module 'dashboard.label', []

app.factory 'Label', ($resource) ->
  $resource '/api/labels/:id', { id: '@id' }, { update: { method: 'PUT', isArray: false } }