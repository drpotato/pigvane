class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)

        @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 100, 600, 'hat_npc', null, 'dialog_template')
        
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        
        #@music = @game.add.audio 'city_music', 0.5, true
        #@music.play();
        
        @soundManager.music = @soundManager.add('city_music', 0.75, true)
        @soundManager.music.play()
        
    
    spawnRandomNPCs: () ->
    	for i in [0...50]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 400, 'hat_npc')
        
    setVariables: () ->
        @config.background = 'background'
        @config.tilemap = 'city-tm'
        @config.tileset = 'city-ts'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 8, true, true, true, true
        