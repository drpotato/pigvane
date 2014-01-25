class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        
        super(@game)

        @spawnRandomNPCs()
        
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 100, 600, 'npc_oldman', 'old_man_kill', 'old_man_help', 'dialog_template')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 200, 600, 'npc_pig_girl','pig_owner_kill', 'pig_owner_kill', 'dialog_template')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 300, 600, 'npc_monk', 'monk_kill', 'monk_help', 'dialog_template')
        @npcController.npcs.add new Pigvane.Classes.NPCSpecial(@game, 400, 600, 'npc_ice_cream_girl', 'kid_help', 'kid_help', 'dialog_template')
        
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        
        @music = @game.add.audio 'city_music', 0.5, true
        @music.play();
        
        #@soundManager.music = @soundManager.add('city_music', 0.75, true)
        #@soundManager.music.play()
        
    
    spawnRandomNPCs: () ->
    	for i in [0...50]
    		@npcController.npcs.add new Pigvane.Classes.NPC(@game, @game.world.randomX, 400, 'hat_npc')
        
    setVariables: () ->
        @config.background = 'city-bg'
        @config.tilemap = 'city-tm'
        @config.tileset = 'city-ts'

    initCollisions: () ->
    	@tileset.setCollisionRange 0, 8, true, true, true, true
        