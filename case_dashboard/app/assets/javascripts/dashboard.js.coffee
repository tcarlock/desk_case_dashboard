#= require ./dashboard.case
#= require ./dashboard.label

app = angular.module 'dashboard', ['ngRoute', 'ngResource', 'dashboard.case', 'dashboard.label']

# Rails CSRF protection
app.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($locationProvider, $routeProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider.when '/', templateUrl: '/templates/index', controller: 'IndexController'

app.controller 'IndexController', ($scope, Case, Label) ->
  $scope.view = 'manage_cases'

  $scope.views = [
    {
      id: 'manage_cases'
      label: 'Manage Cases'
    },
    {
      id: 'manage_labels'
      label: 'Manage Labels'
    }
  ]

  $scope.viewId = (index) ->
    $scope.views[index].id

  $scope.getLabelDetails = (label) ->
    console.log ($scope.labels.filter (l) -> label.name is label)
    label for label in $scope.labels when label.name is label

  Label.query {}, (labels) ->
    $scope.labels = labels

  Case.query {}, (cases) ->
    $scope.cases = cases