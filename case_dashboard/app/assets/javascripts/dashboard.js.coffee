#= require ./dashboard.case

app = angular.module 'dashboard', ['ngRoute', 'dashboard.case']

# Rails CSRF protection
app.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.config ($locationProvider, $routeProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider.when '/', templateUrl: '/templates/index', controller: 'CasesController'