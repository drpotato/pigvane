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
        
        # @background = @game.add.sprite 0, 0, @config.background
        # @background.fixedToCamera = true 

        # Add the map and tileset that we loaded earlier 
        @map = @add.tilemap @config.tilemap
        @map.addTilesetImage @config.tileset

        @initCollisions()

        # @bgScroll1 = @add.tileSprite(0, 0, 8000, 1000, @config.bgScroll1)
        # @bgScroll1.tilePosition.x = 0
        # @bgScroll1.tilePosition.y = -100

        # @bgScroll2 = @add.tileSprite(0, 0, 8000, 1000, @config.bgScroll2)
        # @bgScroll2.tilePosition.x = 0
        # @bgScroll2.tilePosition.y = -200

        # @repositionParallax()

        @mainLayer = @map.createLayer 'Tile Layer 1'
        @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#b2dcef"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 400, 400
        @add.existing @dude
        
        @npcController = new Pigvane.Classes.NPCController @game
        
        # Add the achievements
        @achievements = new Pigvane.Classes.Achievements @game
        
        # Add the dialog
        @dialog = new Pigvane.Classes.Dialog @game

        @bullets = @add.group()

        @bullets.createMultiple 1000, 'bullet'
        @bullets.setAll 'anchor.x', 0.5
        @bullets.setAll 'anchor.y', 0.5
        @bullets.setAll 'outOfBoundsKill', true

        @bullets.forEach( (obj) ->
            # obj.body.setRectangle 8, 8, 12, 12 # Broken as of 1.1.4
            obj.animations.add('shoot', [0,1,2])
            obj.animations.add('repeat', [1,2])

            )

        @enemyBullets = @add.group()

        @enemyBullets.createMultiple 20, 'enemyBullet'
        @enemyBullets.setAll 'anchor.x', 0.5
        @enemyBullets.setAll 'anchor.y', 0.5
        @enemyBullets.setAll 'outOfBoundsKill', true

        @enemyBullets.forEach( (obj) ->
            # obj.body.setRectangle 8, 8, 12, 12 # Broken as of 1.1.4
            obj.animations.add('shoot', [0,1,2])
            obj.animations.add('repeat', [1,2])
            )

        # @fgLayer = @add.tileSprite(0, 0, 8000, 1000, @config.fgScroll)
        
        @healthBar = new Pigvane.Classes.HealthOverlay @game

        @aggroHelper = new Pigvane.Classes.aggroHelper @game
        

        @cameraController = new Pigvane.Classes.CameraController @game

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
        @game.physics.collide(@bullets, @mainLayer, (obj1, obj2) -> 
            obj1.visible = false
            obj1.kill()
            )

        
        @npcController.update()

        @cameraController.update()

    nextState: () ->
        Pigvane.levelController.changeToLevel()
