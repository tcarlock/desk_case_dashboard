app = angular.module 'dashboard.case', []

app.controller 'ProfilesController', ($scope, $route, $routeParams, $location, $q, Profile, Project, Showcase, currentUserLoader) ->
  $scope.currentUser = currentUserLoader

app.controller 'CasesController', ($scope) ->
  $scope.cases = [
    { title: 'test' },
    { title: 'test' },
    { title: 'test' },
    { title: 'test' }
  ]