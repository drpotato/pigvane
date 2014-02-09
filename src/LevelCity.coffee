class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
        @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 3200, 384, 'npc_oldman', 4, 'old_man_kill', 'old_man_help', 'old_man')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 4192, 160, 'npc_pig_girl', 2, 'pig_owner_kill', 'pig_owner_help', 'girl_with_pig')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 512, 512, 'npc_monk', 2, 'monk_kill', 'monk_help', 'monk')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 5568, 288, 'npc_ice_cream_girl', 2, 'kid_kill', 'kid_help', 'ice_cream_kid')
        
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        
        @soundManager.music = @game.add.audio 'city_music', 0.5, true
        # @soundManager.music.play()
        
        #@soundManager.music = @soundManager.add('city_music', 0.75, true)
        #@soundManager.music.play()
    
    repositionParallax: () ->
    
    spawnRandomNPCs: () ->
        for i in [0...50]
            @npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 800, 'hat_npc')

    repositionParallax: () ->

        
    initConfig: () ->
        @config.background = 'city-bg'
        @config.tilemap = 'city-tm'
        @config.tileset = 'citytiles'
        @config.bgScroll1 = 'city-bgScroll1'
        @config.bgScroll2 = 'city-bgScroll2'
        @config.fgScroll = 'city-fg'
        @config.nextLeveLX = 8200
        @config.vignette = "city-vignette"

    initCollisions: () ->
        @map.setCollisionBetween 0, 2
        