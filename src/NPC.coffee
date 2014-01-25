class Pigvane.Classes.NPC extends Phaser.Sprite
    constructor: (@game, x, y, name, deathAchievement) ->
        
        super @game, x, y, name
        
        # Set collision size
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        @facing = 'left'

        @body.gravity.y = 10
        
        @health = 3
        
    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer
        
    hit: () ->
        
        if @health > 0
            @health -= 1
        
            if @health <= 0
                @die()
    
    die: () ->
        
        if deathAchievement?
            Pigvane.Main.achievements.grant(deathAchievement)
            
        
        