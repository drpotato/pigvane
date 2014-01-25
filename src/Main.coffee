class Pigvane.States.Main
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @gameWidth = 5
        
        # Create a sound manager and add music
        @soundManager = new Phaser.SoundManager(@game)
        
        @soundManager.musicCity = @soundManager.add 'ambient_city_music', 1, true
        @soundManager.musicCandy = @soundManager.add 'ambient_candy_music', 1, true
        @soundManager.musicForest = @soundManager.add 'ambient_forest_music', 1, true
        
        # @soundManager.musicCity.play()

        @background = @add.sprite 0, 0, 'background'
        @background.fixedToCamera = true 

        # Add the map and tileset that we loaded earlier 
        @map = @game.add.tilemap 'test'
        @tileset = @game.add.tileset 'blocks'

        @tileset.setCollisionRange 0, 8, true, true, true, true

        @paraLayer1 = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 0
        @paraLayer1.scrollFactorX = 0.2

        @paraLayer2 = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 1
        @paraLayer2.scrollFactorX = 0.5

        @mainLayer = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 2
        @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#222034"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 100, 550
        @add.existing @dude
        
        @npcController = new Pigvane.Classes.NPCController @game
        
        # Add the achievements
        @achievements = new Pigvane.Classes.Achievements @game

        @bullets = @add.group()

        @bullets.createMultiple 60, 'bullet'
        @bullets.setAll('anchor.x', 0.5);
        @bullets.setAll('anchor.y', 0.5);
        @bullets.setAll('outOfBoundsKill', true);

        @overlay = @add.sprite 0,0, 'scanlines'
        @overlay.fixedToCamera = true 

        @vignette = @add.sprite 0,0, 'vignette'
        @vignette.fixedToCamera = true 

        @healthBar = new Pigvane.Classes.HealthOverlay @game
        @camera.follow @dude, 1

    # Called every frame
    update: ->
        if @game.input.keyboard.isDown Phaser.Keyboard.C
            new Pigvane.Classes.Dialog(@game)


        # Make camera follow dude
        
        @npcController.update()
        


    # Some helper functions used throughout the game
    calculateDistance: (aX, aY, bX, bY) ->
        return Math.pow Math.pow( aX - bX, 2 ) + Math.pow( aY - bY, 2 ), 0.5

        

        
