class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)
        
        @npcController.npcs.add new Pigvane.Classes.NPC(@game, 100, 50, 'hat_npc', 'kill_1', 'dialog_template')
        
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        @soundManager.music = @soundManager.add 'ambient_city_music', 1, true
        
        # @soundManager.music.play()
        
    setVariables: () ->
        @config.background = 'background'
        @config.tilemap = 'city'
        @config.tileset = 'blocks'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 8, true, true, true, true
        