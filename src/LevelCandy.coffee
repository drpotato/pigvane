class Pigvane.Classes.LevelCandy extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
        @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 448, 512, 'npc_candy_crusher', 8, 'crusher_kill', 'crusher_help', 'candy_crusher')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 1312, 512, 'npc_kitty', 2, 'cat_kill', 'cat_help', 'cake_cat')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 3456, 320, 'npc_fruit_ninja', 2, 'ninja_kill', 'ninja_help', 'fruit_ninja')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 4416, 288, 'npc_angry_pig', 2, 'sick_pig_help', 'sick_pig_help', 'angry_pig')
        
    doSound: () ->
        
        @soundManager.music = @game.add.audio 'circus_music', 0.5, true
        @soundManager.music.play();
    
    spawnRandomNPCs: () ->
    	for i in [0...100]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 10, 'hat_npc')
        
    initConfig: () ->
        @config.background = 'candy-bg'
        @config.tilemap = 'candy-tm'
        @config.tileset = 'candy-ts'
        @config.bgScroll1 = 'candy-bgScroll1'
        @config.bgScroll2 = 'candy-bgScroll2'
        @config.nextLeveLX = 9000
        @config.vignette = "candy-vignette"

    repositionParallax: () ->
        @bgScroll.tilePosition.y = 0
        @bgbgScroll.tilePosition.y = 0

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 30, true, true, true, true
