class Pigvane.Classes.NPC extends Phaser.Sprite
    constructor: (@game, x, y, name) ->
        
        super @game, x, y, name
        
        # Set collision size
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        @facing = 'left'

        @body.gravity.y = 10
        
    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer