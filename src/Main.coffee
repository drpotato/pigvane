class Pigvane.States.Main
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Set up cross Class communication as we cannot access parent classes in js
        Pigvane.Main = @

        @gameWidth = 5

        # Add the map and tileset that we loaded earlier 
        @map = @game.add.tilemap 'test'
        @tileset = @game.add.tileset 'blocks'

        @tileset.setCollisionRange 0, 1, true, true, true, true

        @mainLayer = @game.add.tilemapLayer 0, 0, 100*32, 672, @tileset, @map, 0
        # @mainLayer.resizeWorld()

        @game.stage.backgroundColor = "#fff"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 10, 10
        @add.existing @dude
        
        #add damage overlay
        @damageOverlay = new Pigvane.Classes.DamageOverlay @game,@dude
        @add.existing @damageOverlay
    # Called every frame
    update: ->

        # Make camera follow dude
        # @game.world.camera.x = @dude.x-400


    # Some helper functions used throughout the game
    calculateDistance: (aX, aY, bX, bY) ->
        return Math.pow Math.pow( aX - bX, 2 ) + Math.pow( aY - bY, 2 ), 0.5