class Pigvane.Classes.LevelCandy extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
        # @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 3200, 384, 'npc_oldman', 4, 'old_man_kill', 'old_man_help', 'old_man')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 4192, 160, 'npc_pig_girl', 2, 'pig_owner_kill', 'pig_owner_kill', 'girl_with_pig')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 512, 512, 'npc_monk', 2, 'monk_kill', 'monk_help', 'monk')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 5568, 288, 'npc_ice_cream_girl', 2, 'kid_help', 'kid_help', 'ice_cream_kid')
        
    doSound: () ->
        
        @soundManager.music = @game.add.audio 'circus_music', 0.5, true
        @soundManager.music.play();
    
    spawnRandomNPCs: () ->
    	for i in [0...100]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 10, 'hat_npc')
        
    setVariables: () ->
        @config.background = 'candy-bg'
        @config.tilemap = 'candy-tm'
        @config.tileset = 'candy-ts'
        @config.bgScroll1 = 'candy-bgScroll1'
        @config.bgScroll2 = 'candy-bgScroll2'
        @config.nextLeveLX = 1000

    repositionParallax: () ->
        @bgScroll.tilePosition.y = 0
        @bgbgScroll.tilePosition.y = 0

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 30, true, true, true, true
