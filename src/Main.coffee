class Pigvane.States.Main
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @gameWidth = 5

        @background = @add.sprite 0, 0, 'background'
        @background.fixedToCamera = true 

        # Add the map and tileset that we loaded earlier 
        @map = @game.add.tilemap 'test'
        @tileset = @game.add.tileset 'blocks'

        @tileset.setCollisionRange 0, 8, true, true, true, true

        @paraLayer1 = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 0

        @paraLayer2 = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 1

        @mainLayer = @game.add.tilemapLayer 0, 0, 896, 672, @tileset, @map, 2
        @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#fff"
        
        @achievements = new Pigvane.Classes.Achievements @game

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 100, 550
        @add.existing @dude

        @overlay = @add.sprite 0,0, 'scanlines'
        @overlay.fixedToCamera = true 

        @camera.follow @dude, 1

    # Called every frame
    update: ->

        # Make camera follow dude
        # @world.camera.x = @dude.x-100


    # Some helper functions used throughout the game
    calculateDistance: (aX, aY, bX, bY) ->
        return Math.pow Math.pow( aX - bX, 2 ) + Math.pow( aY - bY, 2 ), 0.5

        

        