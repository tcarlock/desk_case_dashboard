app = angular.module 'dashboard.case', []

app.factory 'Case', ($resource) ->
  $resource '/api/cases/:id', { id: '@id' }, { update: { method: 'PUT', isArray: false } }