class Pigvane.States.Main
    
    constructor: (@game) ->
        Pigvane.levelController = @
        
    preload: (@game) ->
        @game.state.add '1', Pigvane.Classes.Level1, false
        @game.state.add '2', Pigvane.Classes.Level2, false
        @game.state.add '3', Pigvane.Classes.Level2, false
        @loadLevel()
        # @levelCity = new Pigvane.Classes.LevelCity(@game)
        
    update: () ->
        if @currentLevel?
            @currentLevel.update()

    loadLevel: () ->
        switch @currentLevelIndex
            when 0
                @game.state.start '1'
            when 1
                @game.state.start '2'
            when 2
                @game.state.start '3'

    changeToLevel: () ->
        # @game.state.remove 'City'
        @currentLevelIndex = @nextLevelIndex
        @loadLevel()

        
