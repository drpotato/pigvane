class Pigvane.States.Main
    
    constructor: (@game) ->
        Pigvane.levelController = @

        @currentLevelIndex = 1
        
        
    preload: (@game) ->
        @loadLevel()
        # @levelCity = new Pigvane.Classes.LevelCity(@game)
        
    update: () ->
        if @currentLevel?
            @currentLevel.update()

    loadLevel: () ->
        switch @currentLevelIndex
            when 0
                @currentLevel = new Pigvane.Classes.LevelCity @game
            when 1
                @currentLevel = new Pigvane.Classes.LevelCandy @game
            when 2
                @currentLevel = new Pigvane.Classes.LevelForest @game
            when 3
                @currentLevel = new Pigvane.Classes.End @game

        
