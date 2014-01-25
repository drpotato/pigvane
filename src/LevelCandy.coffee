class Pigvane.Classes.LevelCandy extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)
        
        # @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 100, 600, 'hat_npc', 'kill_1', 'dialog_template')
        
    doSound: () ->
        @soundManager.music = @soundManager.add 'circus_music', 1, true
        
        # @soundManager.music.play()
    
    spawnRandomNPCs: () ->
    	for i in [0...100]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 10, 'hat_npc')
        
    setVariables: () ->
        @config.background = 'background'
        @config.tilemap = 'candy-tm'
        @config.tileset = 'candy-ts'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 25, true, true, true, true