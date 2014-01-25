class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)
        
    doSound: () ->
        @soundManager.music = @soundManager.add 'ambient_city_music', 1, true
        
        # @soundManager.music.play()
        
    setVariables: () ->
        @config.background = 'background'
        @config.tilemap = 'city'
        @config.tileset = 'blocks'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 8, true, true, true, true
        