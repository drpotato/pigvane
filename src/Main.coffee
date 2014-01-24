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

        @mainLayer = @game.add.tilemapLayer 0, 0, @game.width, @game.height, @tileset, @map, 0

        # Set up the main groups
        @groups = []
        @groups.groundGroup = @game.add.group()
        @groups.airGroup = @game.add.group()
        @groups.bulletsGroup = @game.add.group()

        @game.stage.backgroundColor = "#fff"

        # Add the main guy 
        @dude = new Pigvane.Classes.Dude @game, 400, 400
        @groups.groundGroup.add @dude

    # Called every frame
    update: ->
        @game.physics.collide @groups.groundGroup, @mainLayer
        # Do collisions. We use overlap so it can pass through dead bodies.
        # @game.physics.collide(@dude, @groups.groundGroup, @groundCollide)
        # @game.physics.overlap(@groups.bulletsGroup, @groups.groundGroup, @bulletCollide)

        # Make camera follow dude
        # @game.world.camera.x = @dude.x-400
        # @game.world.camera.y = @dude.y-400

    # groundCollide: (obj1, obj2) ->
    #     if obj2.name is 'enemy' and obj2.health > 0
    #         Pigvane.Main.dude.hitByEnemy()

    # bulletCollide: (obj1, obj2) ->
        # Catch the error if the receiver doesn't actually have a `.hitByBullet` method
        # try
        #     obj2.hitByBullet(obj1)
        # catch
        #     console.log "Implement hitByBullet for #{obj2.name}"

    # Some helper functions used throughout the game
    calculateDistance: (aX, aY, bX, bY) ->
        return Math.pow Math.pow( aX - bX, 2 ) + Math.pow( aY - bY, 2 ), 0.5

    calculateVelocity: (sourceX, sourceY, destX, destY, velocity) ->
        vel = {}
        vel.x = destX - sourceX
        vel.y = destY - sourceY
        factor = Math.pow( Math.pow(vel.x, 2) + Math.pow(vel.y, 2), 0.5 ) / velocity

        return {x: vel.x / factor, y: vel.y / factor}


        

        