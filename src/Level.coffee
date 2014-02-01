class Pigvane.Classes.Level
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @gameWidth = 5
        
        # Create a sound manager and add music
        @soundManager = new Phaser.SoundManager(@game)
        
        @soundManager.sfxJump = @soundManager.add 'sfx_jump', 0.5
        @soundManager.sfxGunshotPlayer = @soundManager.add 'sfx_gunshot_player', 0.25
        @soundManager.sfxGunshotEnemy = @soundManager.add 'sfx_gunshot_enemy', 0.25
        @soundManager.sfxDeathScream = @soundManager.add 'sfx_death_scream', 1
        @soundManager.sfxCollectable = @soundManager.add 'sfx_collectable', 0.5
        
        @doSound()
        
        @config = {}
        @initConfig()
        
        @background = @game.add.sprite 0, 0, @config.background
        @background.fixedToCamera = true 

        # Add the map and tileset that we loaded earlier 
        @map = @game.add.tilemap @config.tilemap
        @tileset = @game.add.tileset @config.tileset

        @initCollisions()

        @bgScroll1 = @game.add.tileSprite(0, 0, 500*32, 1024, @config.bgScroll1)
        @bgScroll1.tilePosition.x = 0
        @bgScroll1.tilePosition.y = -100

        @bgScroll2 = @game.add.tileSprite(0, 0, 500*32, 1024, @config.bgScroll2)
        @bgScroll2.tilePosition.x = 0
        @bgScroll2.tilePosition.y = -200

        @repositionParallax()

        @mainLayer = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 0
        @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#222034"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 100, 400
        @game.add.existing @dude
        
        @npcController = new Pigvane.Classes.NPCController @game
        
        # Add the achievements
        @achievements = new Pigvane.Classes.Achievements @game
        
        # Add the dialog
        @dialog = new Pigvane.Classes.Dialog @game

        @bullets = @game.add.group()

        @bullets.createMultiple 1000, 'bullet'
        @bullets.setAll 'anchor.x', 0.5
        @bullets.setAll 'anchor.y', 0.5
        @bullets.setAll 'outOfBoundsKill', true

        @bullets.forEach( (obj) ->
            obj.body.setSize 8, 8, 12, 12
            obj.animations.add('shoot', [0,1,2])
            obj.animations.add('repeat', [1,2])

            )

        @enemyBullets = @game.add.group()

        @enemyBullets.createMultiple 20, 'enemyBullet'
        @enemyBullets.setAll 'anchor.x', 0.5
        @enemyBullets.setAll 'anchor.y', 0.5
        @enemyBullets.setAll 'outOfBoundsKill', true

        # @enemyBullets.forEach( (obj) ->
        #     obj.animations.add('shoot', [0,1,2,3])
        #     obj.animations.add('repeat', [2,3])
        #     )

        @fgLayer = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 1

        @overlay = @game.add.sprite 0, 0, 'scanlines'
        @overlay.fixedToCamera = true 

        @vignette = @game.add.sprite 0, 0, @config.vignette
        @vignette.fixedToCamera = true 

        @healthBar = new Pigvane.Classes.HealthOverlay @game
        
        @game.world.camera.follow @dude, 1

        @subPreload()

    # Called every frame
    update: ->
        if @dude.x > @config.nextLeveLX
            log Pigvane.levelController.currentLevelIndex
            Pigvane.levelController.nextLevelIndex = Pigvane.levelController.currentLevelIndex + 1
            @fadeOut()

        if Pigvane.Main.dlc? and @dude.x > 6240
            Pigvane.Main.dlc.popup()

        @game.physics.overlap(@enemyBullets, @dude, @dude.hitByNPC)
        
        @npcController.update()

    nextState: () ->
        Pigvane.levelController.changeToLevel()
        # @game.state.start 'Candy', true, true

    fadeOut: () ->

        # spr_bg = @game.add.graphics 0, 0
        # spr_bg.fixedToCamera = true
        # spr_bg.beginFill 0x000000, 1
        # spr_bg.drawRect 0, 0, @game.width*10, @game.height*10
        # spr_bg.alpha = 0
        # spr_bg.endFill()

        # s = this.game.add.tween spr_bg
        # s.to({ alpha: 1 }, 1000, Phaser.Easing.Linear.None, true)
        # s.onComplete.add(Pigvane.levelController.changeToLevel, Pigvane.levelController)
        # s.start()
        
        Pigvane.Main.soundManager.music.stop()
        Pigvane.levelController.changeToLevel()


