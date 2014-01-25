class Pigvane.Classes.Level
    # `@game` automatically creates this.game
    constructor: (@game) ->

        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @gameWidth = 5
        
        # Create a sound manager and add music
        @soundManager = new Phaser.SoundManager(@game)
        
        @doSound()
        
        @config = {}
        @setVariables()
        
        @background = @game.add.sprite 0, 0, @config.background
        @background.fixedToCamera = true 

        # Add the map and tileset that we loaded earlier 
        @map = @game.add.tilemap @config.tilemap
        @tileset = @game.add.tileset @config.tileset

        # @bgmap = @game.add.tilemap 'bg'
        # @bgTileSet = @game.add.tileset 'bgTile'
        
        @initCollisions()

        # @paraLayer2 = @game.add.sprite 0, 0, 896, 672, @bgTileSet, @bgmap, 2
        # @paraLayer1.scrollFactorX = 0.2

        # @paraLayer2 = @game.add.sprite 0, 0, 896, 672, @tileset, @map, 1
        # @paraLayer2.scrollFactorX = 0.5

        @mainLayer = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 0
        @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#222034"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 100, 550
        @game.add.existing @dude
        
        @npcController = new Pigvane.Classes.NPCController @game
        
        # Add the achievements
        @achievements = new Pigvane.Classes.Achievements @game
        
        # Add the dialog
        @dialog = new Pigvane.Classes.Dialog @game

        @bullets = @game.add.group()

        @bullets.createMultiple 200, 'bullet'
        @bullets.setAll 'anchor.x', 0.5
        @bullets.setAll 'anchor.y', 0.5
        @bullets.setAll 'outOfBoundsKill', true

        @overlay = @game.add.sprite 0, 0, 'scanlines'
        @overlay.fixedToCamera = true 

        @vignette = @game.add.sprite 0, 0, 'vignette'
        @vignette.fixedToCamera = true 

        @healthBar = new Pigvane.Classes.HealthOverlay @game
        
        @game.world.camera.follow @dude, 1

    # Called every frame
    update: ->
        
        @npcController.update()
        


    # Some helper functions used throughout the game
    calculateDistance: (aX, aY, bX, bY) ->
        return Math.pow Math.pow( aX - bX, 2 ) + Math.pow( aY - bY, 2 ), 0.5

        

        
