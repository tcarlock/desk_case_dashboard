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

app.controller 'IndexController', ($scope, Case, Label, labelTypes, labelColors, $timeout) ->
  $scope.view = 'manage_cases'
  $scope.displayLabelEditor = false

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

  $scope.addLabel = ->


  $scope.getLabelDetails = (label) ->
    $scope.labels.filter((l) ->
      l.name is label
    )[0]

  $scope.showLabelEditor = ->
    $scope.init()
    $scope.displayLabelEditor = true

  $scope.labelColors = labelColors
  $scope.labelTypes = labelTypes

  $scope.saveLabel = ->
    $scope.saveStatus = "Saving..."
    Label.save($scope.newLabel, ->
      $scope.init()
      $scope.displayLabelEditor = false
    , ->
      $scope.saveStatus = "We're sorry. There was a problem saving this label."

      $timeout ->
        $scope.saveStatus = ''
      , 2500
    )

  $scope.cancelLabel = ->
    $scope.initLabel()
    $scope.displayLabelEditor = false

  $scope.initLabel = ->
    $scope.saveStatus = ''
    $scope.newLabel =
      name: ''
      description: ''
      enabled: 'true'
      color: 'default'
      type: 'case'

  $scope.init = ->
    $scope.initLabel()

    Label.query {}, (labels) ->
      $scope.labels = labels

    Case.query {}, (cases) ->
      $scope.cases = cases

  $scope.init()