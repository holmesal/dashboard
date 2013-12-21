'use strict'

angular.module('dashboardApp')
  .directive('dashboard', ($timeout) ->
    template: '<div></div>'
    restrict: 'E'
    scope:
        user: '='
    link: (scope, element, attrs) ->

        scope.data = []
        # scope.data.push
        #   from: 'Alonso Holmes'
        #   subject: 'Get moving!'
        #   time: Date.now()
        #   important: false
        # scope.data.push
        #   from: 'Alonso Holmes'
        #   subject: 'Get moving!'
        #   time: Date.now()
        #   important: false

        # console.log scope.data
        # console.log this

        for i in [0..200]
            scope.data.push 'hi'

        class Thing 

            constructor: (@data) ->
                console.log 'new thing created'
                console.log @data
                @init()

            init: ->
                # Planets are first-class citizens
                @group = scope.svg.append 'g'
                # Call the draw function
                @draw()
                # @planet = scope.svg.selectAll('circle')
                # .data(@data)
                # @planet = @planets[0]

                # @drawPlanet()

            # drawPlanet: ->
                # This should vary by type (facebook, tasks, etc)
                # For example:
                

            # drawOrbiting: ->


        class Task extends Thing
            
            draw: ->
                @drawPlanet()

            drawPlanet: ->
                console.log 'draw planet called!'
                console.log @group
                @planet = @group.selectAll('circle')
                    .data(@data)
                    .enter()
                    .append('circle')
                    .attr('cx', (d, i) ->
                        scope.dims.width * Math.random()
                        # i*800/100
                    ).attr('cy', (d, i) ->
                        scope.dims.height * Math.random()
                        # i*800/100
                    ).attr('r', 20)



        init = ->

            scope.things = []

            # Add svg to root element
            # console.log @svg
            scope.svg = d3.select(element[0])
                .append('svg')
                .attr('width',window.outerWidth)
                .attr('height',window.outerHeight)
                .call(d3.behavior.zoom().scaleExtent([1, 50]).on("zoom", zoom))

            console.log scope.svg

            scope.dims = 
                width: scope.svg.attr 'width'
                height: scope.svg.attr 'height'

            console.log scope.dims

            # TODO - react to window size change

            draw()
            move()
            # grow()
            # setData()
            # Spoof some data
            things = []
            things.push
                type: 'tasks'
                tasks: ['one', 'two', 'three']
            # task = new Task things[0]



        fakeRemove = ->
            $timeout ->
                console.log 'removing data'
                scope.$apply ->
                    scope.data = []
                    setData()
            , 3000
            

        # Draw!
        draw = ->
            scope.circles = scope.svg.selectAll('circle')
            .data(scope.data)
            .enter()
            .append('circle')
            .attr('cx', (d, i) ->
                Math.random()*1400
                # i*800/100
            ).attr('cy', (d, i) ->
                Math.random()*900
                # i*800/100
            ).attr('r', 2)

            # circles.attr('cx',50)
            # .attr('cy',50)
            # .attr('r', 100)

        grow = ->
            scope.circles.transition()
            .attr('transform','translate(-1000,-1000)scale(5)')
            .duration(1000)
            .delay(5000)

        move = ->
            scope.circles.transition()
            .attr('cx', (d,i) ->
                Math.random()*1400
                200
            ).attr('cy', (d,i) ->
                Math.random()*900
            ).duration(2000)
            .delay(2000)

        zoom = ->
            scope.circles.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")")

        setData = ->
            # Select and bind the planets
            scope.planets = scope.svg.selectAll('circle')
                .data(scope.data)

            # Entering data
            scope.planets.enter()
                .append('circle')
                .attr('cx', (d, i) ->
                    scope.dims.width * Math.random()

                    # i*800/100
                ).attr('cy', (d, i) ->
                    scope.dims.height * Math.random()
                    # i*800/100
                ).attr('r', 20)

            # Exiting data
            scope.planets.exit()
                .transition()
                .attr('r',0)
                .duration(1000)
                .remove()

        init()
        
  )
