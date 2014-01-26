class Pigvane.States.Main
    
    constructor: (@game) ->
        Pigvane.levelController = @

        @currentLevelIndex = 1
        @nextLevelIndex = 1
        
    preload: (@game) ->
        @game.state.add 'City', Pigvane.Classes.LevelCity, false
        @game.state.add 'Candy', Pigvane.Classes.LevelCandy, false
        @game.state.add 'End', Pigvane.Classes.End
        @loadLevel()
        # @levelCity = new Pigvane.Classes.LevelCity(@game)
        
    update: () ->
        if @currentLevel?
            @currentLevel.update()

    loadLevel: () ->
        switch @currentLevelIndex
            when 0
                @game.state.start 'City'
                Pigvane.Main.achievements = new Pigvane.Classes.Achievements @game
            when 1
                @game.state.start 'Candy'
            when 2
                @game.state.start 'End'

    changeToLevel: () ->
        # @game.state.remove 'City'
        @currentLevelIndex = @nextLevelIndex
        @loadLevel()

        
