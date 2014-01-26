class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)

        @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 3200, 384, 'npc_oldman', 4, 'old_man_kill', 'old_man_help', 'old_man')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 4192, 160, 'npc_pig_girl', 2, 'pig_owner_kill', 'pig_owner_kill', 'girl_with_pig')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 512, 512, 'npc_monk', 2, 'monk_kill', 'monk_help', 'monk')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 5568, 288, 'npc_ice_cream_girl', 2, 'kid_help', 'kid_help', 'ice_cream_kid')
        
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        
        @soundManager.music = @game.add.audio 'city_music', 0.5, true
        @soundManager.music.play();
        
        #@soundManager.music = @soundManager.add('city_music', 0.75, true)
        #@soundManager.music.play()
    
    repositionParallax: () ->
    
    spawnRandomNPCs: () ->
    	for i in [0...50]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 400, 'hat_npc')
        
    setVariables: () ->
        @config.background = 'city-bg'
        @config.tilemap = 'city-tm'
        @config.tileset = 'city-ts'
        @config.bgScroll1 = 'city-bgScroll1'
        @config.bgScroll2 = 'city-bgScroll2'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 8, true, true, true, true
        