class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)
        
    doSound: () ->
        @soundManager.music = @soundManager.add 'ambient_city_music', 1, true
        
        @soundManager.music.play()
        
    setVariables: () ->
        @config.background = 'background'
        @config.tilemap = 'test'
        @config.tileset = 'blocks'
        