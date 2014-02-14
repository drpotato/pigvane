class Pigvane.Classes.NPC extends Phaser.Sprite
    constructor: (@game, x, y, name) ->
        
        super @game, x, y, name
        
        # Set collision size
        @anchor.setTo(0.5,0.5)

        @addAnimations()

        # Stop it walking out of the world
        # @body.collideWorldBounds = true

        @facing = 'left'

        @body.gravity.y = 500
        
        @health = 3

        @updateTimer = 0
        @shootTimer = 0

        @gunDuration = 0

    addAnimations: () ->
        @animations.add 'walk', [0,1,2,3]
        @animations.play 'walk', 2, true
        
    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer

        if @game.time.now > @updateTimer and @firing is false
            @body.velocity.x = @game.rnd.integerInRange(-20, 20)
            @animations.play 'walk', 2, true
            if @body.velocity.x < 0
                @scale.x = -1
                @facing = 'left'
            else 
                @scale.x = 1
                @facing = 'right'

            @updateTimer = @game.time.now + @game.rnd.integerInRange(40, 60)*100

        if @game.time.now > @shootTimer

            if Math.abs( @body.x - Pigvane.Main.dude.x ) < 200
                    
                if @game.rnd.integerInRange(0,75)+Pigvane.Main.dude.aggro > 65
                    @body.velocity.x = 0
                    @animations.stop()
                    @animations.frame = 4
                    @gunDuration++
                    if @body.x - Pigvane.Main.dude.x > 0
                        @scale.x = -1
                        @facing = 'left'
                    else 
                        @scale.x = 1
                        @facing = 'right'

                if @gunDuration > 1
                    @fire()
                    @firing = true
                    # Pigvane.Main.soundManager.sfxGunshotEnemy.play()


            else
                @gunDuration = 0
                @firing = false


            @shootTimer = @game.time.now + @game.rnd.integerInRange(3, 8)*100

    fire: () ->

        # See if there is a free bullet 
        bullet = Pigvane.Main.enemyBullets.getFirstExists false

        bulletVelocity = 1000

        # If there is one
        if bullet
            # Reset it to the dude's position
            bullet.reset @x, @y

            bullet.animations.frame = 0
            # bullet.animations.play('shoot', 60)

            callback = () ->
                bullet.animations.stop()
                bullet.animations.play('repeat', 30, true)
                bullet.animations.frame = if bullet.x % 2 == 0 then 1 else 2

            setTimeout callback, 17

            deltaX = @body.x - Pigvane.Main.dude.body.x
            deltaY = @body.y - Pigvane.Main.dude.body.y

           

            if @facing is 'right'
                bullet.body.velocity.x = bulletVelocity
            else if @facing is 'left'
                bullet.body.velocity.x = -bulletVelocity

            bullet.body.velocity.y = deltaY * bullet.body.velocity.x / deltaX

            # Randomise velocity
            bullet.body.velocity.x += @game.rnd.integerInRange(-100, 100)
            bullet.body.velocity.y += @game.rnd.integerInRange(-40, 40)

    hit: () ->
        
        if @health > 0
            @health -= 1
            Pigvane.Main.dude.incAggro(1)
        
            if @health <= 0
                @die()
                return 'kill'
    
    die: () ->
        Pigvane.Main.scoreHandler.add(10)
        @kill()
        @destroy()
        Pigvane.Main.dude.kills += 1
        Pigvane.Main.dude.aggro += 1
    