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

app.controller 'IndexController', ($scope, Case, Label, labelTypes, labelColors) ->
  $scope.view = 'manage_labels'
  $scope.displayLabelEditor = true

  $scope.views = [
    {
      id: 'manage_cases'
      label: 'Cases'
    },
    {
      id: 'manage_labels'
      label: 'Labels'
    }
  ]

  $scope.viewId = (index) ->
    $scope.views[index].id

  $scope.getLabelDetails = (label) ->
    $scope.labels.filter((l) ->
      l.name is label
    )[0]

  $scope.showLabelEditor = ->
    $scope.initLabel()
    $scope.displayLabelEditor = true

  $scope.labelColors = labelColors
  $scope.labelTypes = labelTypes

  $scope.initLabel = ->
    $scope.newLabel =
      name: ''
      description: ''
      enabled: 'true'
      color: 'default'
      type: 'case'

  $scope.saveLabel = ->
    Label.save $scope.newLabel, ->
      $scope.initLabel()

  $scope.cancelLabel = ->
    $scope.initLabel()
    $scope.displayLabelEditor = false


  Label.query {}, (labels) ->
    $scope.labels = labels

  Case.query {}, (cases) ->
    $scope.cases = cases

  $scope.initLabel()