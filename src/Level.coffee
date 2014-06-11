class Pigvane.Classes.Level
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @onUpdate = new Phaser.Signal()

        @gameWidth = 5

        # Create a sound manager and add music
        @soundManager = new Phaser.SoundManager(@game)

        @soundManager.sfxJump = @soundManager.add 'sfx_jump', 0.5
        @soundManager.sfxGunshotPlayer = @soundManager.add 'sfx_gunshot_player', 0.25
        @soundManager.sfxGunshotPlayerPistol = @soundManager.add 'sfx_gunshot_player_pistol', 0.25
        @soundManager.sfxGunshotEnemy = @soundManager.add 'sfx_gunshot_enemy', 0.25
        @soundManager.sfxDeathScream = @soundManager.add 'sfx_death_scream', 1
        @soundManager.sfxCollectable = @soundManager.add 'sfx_collectable', 0.5
        @soundManager.sfxHeartbeat = @soundManager.add 'sfx_heartbeat', 1, true
        @soundManager.music = @soundManager.add 'music', 0.25, true

        @doSound()

        @config = {}
        @initConfig()

        @background = @game.add.tileSprite 0, 0, 8000, 1000, @config.background
        @background.fixedToCamera = true

        # Add the map and tileset that we loaded earlier
        @map = @add.tilemap @config.tilemap
        @map.addTilesetImage 'tiles'

        @map.setCollisionBetween 0, 2

        @bgScroll1 = @add.tileSprite(0, 0, 32000, 1000, @config.bgScroll1)

        @bgScroll2 = @add.tileSprite(0, 400, 32000, 1000, @config.bgScroll2)

        @mainLayer = @map.createLayer 'Tile Layer 1'
        @mainLayer.resizeWorld()
        @mainLayer.alpha = 0

        @createPlatforms()

        @createFloor()

        @game.stage.backgroundColor = "#000000"

        # Add the main guy

        @gun = new Pigvane.Classes.Gun @game, 100, 100
        @game.add.existing @gun

        @dude = new Pigvane.Classes.Dude @game, 1000, 400
        @add.existing @dude

        @gun.bringToTop()

        @npcController = new Pigvane.Classes.NPCController @game

        # Add the dialog
        @dialog = new Pigvane.Classes.Dialog @game

        @bullets = @add.group()

        @bullets.createMultiple 1000, 'bullet'
        @bullets.setAll 'anchor.x', 0.5
        @bullets.setAll 'anchor.y', 0.5
        @bullets.setAll 'outOfBoundsKill', true

        @bullets.forEach( (obj) ->
            obj.body.setRectangle 8, 8, 12, 12 # Broken as of 1.1.4
            obj.animations.add('shoot', [0,1,2])
            obj.animations.add('repeat', [1,2])

            )

        @enemyBullets = @add.group()

        @enemyBullets.createMultiple 20, 'enemyBullet'
        @enemyBullets.setAll 'anchor.x', 0.5
        @enemyBullets.setAll 'anchor.y', 0.5
        @enemyBullets.setAll 'outOfBoundsKill', true

        @enemyBullets.forEach( (obj) ->
            obj.body.setRectangle 8, 8, 12, 12 # Broken as of 1.1.4
            obj.animations.add('shoot', [0,1,2])
            obj.animations.add('repeat', [1,2])
            )

        # @fgScroll = @add.tileSprite(0, 0, 8000, 2000, @config.fgScroll)

        @healthBar = new Pigvane.Classes.HealthOverlay @game

        @aggroHelper = new Pigvane.Classes.aggroHelper @game

        @scoreHandler = new Pigvane.Classes.scoreHandler @game

        @cameraController = new Pigvane.Classes.CameraController @game

        @weaponHandler = new Pigvane.Classes.weaponHandler @game

        @subPreload()

        @NPCspawntimer = 0

        @input.keyboard.addKey(Phaser.Keyboard.ESC).onDown.add(@exit, @)

    createPlatforms: () ->
        @platformGroup = @game.add.group()

        for pair in Pigvane.platformData[@config.platformData]
            if pair[2]?
                type = 'platform.'+pair[2]
            else
                type = 'platform.1'
            sprite = @game.add.sprite(pair[0]*48, pair[1]*48, Pigvane.Main.config.prefix+type)
            @platformGroup.add sprite

    createFloor: () ->
        @floorGroup = @game.add.group()

        for i in [0...100]
            sprite = @game.add.sprite(i*(8*48), 19*48, @config.floor)


    # Called every frame
    update: ->
        if @game.time.now > @NPCspawntimer
            @spawnRandomNPCs(5)
            @NPCspawntimer = @game.time.now + 5000

        if Pigvane.Main.dlc? and @dude.x > 6240
            Pigvane.Main.dlc.popup()

        # if Pigvane.Main.dude.x > 22000
        if @dude.x > @config.nextLevelX
            @nextLevel()
            # @game.state.start('Level2')

        @game.physics.overlap(@enemyBullets, @dude, @dude.hitByNPC)
        @game.physics.collide(@bullets, @mainLayer, @destroyBullet)
        # @game.physics.collide(@enemyBullets, @mainLayer, @destroyBullet)

        @bgScroll1.tilePosition.x = @game.world.camera.x/2.5
        @bgScroll2.tilePosition.x = @game.world.camera.x/5
        @background.tilePosition.x += 0.2
        # @fgScroll.tilePosition.x = @game.world.camera.x/0.5

        @bullets.forEach( (obj) ->
            if (obj.body.velocity.x == 0)
                obj.visible = false
                obj.kill()
            )

        @onUpdate.dispatch()

    nextState: () ->
        Pigvane.levelController.changeToLevel()

    destroyBullet: (obj1, obj2) ->
        obj1.visible = false
        obj1.kill()

    spawnRandomNPCs: (number=10) ->
        rightBound = @game.camera.x + 1280
        for i in [0...number]
            x = @game.rnd.integerInRange(rightBound, rightBound + 1000)
            y = @game.rnd.integerInRange(400, 850)
            @npcController.npcs.add new Pigvane.Classes.NPC(@game, x, y, @config.prefix+'npc')

    nextLevel: () ->
        @soundManager.music.stop()
        Pigvane.currentLevel++
        if Pigvane.currentLevel <= 5
            @game.state.start('Level'+Pigvane.currentLevel)
        else
            @cameraController.reset()
            @game.state.start('HighScore')

    exit: () ->
        @scoreHandler.forceScore()
        @soundManager.music.stop()
        @game.state.start('MainMenu')
