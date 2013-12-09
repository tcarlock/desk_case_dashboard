app = angular.module 'dashboard.label', []

app.factory 'Label', ($resource) ->
  $resource '/api/labels/:id', { id: '@id' }, { update: { method: 'PUT', isArray: false } }

app.value 'labelColors',
  ["default", "blue", "white", "yellow", "red", "orange", "green", "black", "purple", "brown", "grey", "pink"]

app.value 'labelTypes',
  ["case", "macro", "article"]