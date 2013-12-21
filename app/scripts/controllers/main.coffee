'use strict'

angular.module('dashboardApp')
  .controller 'MainCtrl', ($scope) ->
    
    # Manage user login state

    # Mock user data

    $scope.user = 
    	name: 'Carl'
    	services:
    		github: null
    		twitter: null
    		facebook: null
    	token: 'sometoken'
