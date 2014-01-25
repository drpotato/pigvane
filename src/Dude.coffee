class Pigvane.Classes.Dude extends Phaser.Sprite
    constructor: (@game, x, y) ->
        # Make sure sprite is actually created
        super game, x, y, 'dude'

        # Used in collisions
        @name = 'dude'
        
        # Is a cat?
        @cat = true

        # Set up animations
        @animations.add 'right',[0,1,2,3]
        @animations.add 'jump', [4,5,6,7,8,9]
        # @animations.add 'left', [12,13,14,15]
        
        @animations.play 'jump', 16, true

        # Set collision size
        # @body.setSize 0, 0, 32, 32
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        # Set up some game cursors for later
        @cursors = @game.input.keyboard.createCursorKeys()

        # Next time a bullet can be fired, used in `fire()`
        @nextBullet = 0

        @facing = 'right'

        @body.gravity.y = 10
        
        @lives = 3
        
        @health = 3

    update: () ->
        @game.physics.collide @, Pigvane.Main.mainLayer

        # Reset body
        # @body.velocity.x = 0    

        # Set resulting speed of body
        @vStep = 50
        @velocity = 200
        @jumpVelocity = 300
        # More if running
        @velocity = 700 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR

        # Less if shooting
        @velocity = 100 if @game.input.keyboard.isDown Phaser.Keyboard.X 

        facing = @facing

        # Series of ifs to change dude velocity if arrow keys are pressed
        if @cursors.left.isDown and ( Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x >= 0 )
            @body.velocity.x -= @vStep
            facing = 'left'
        else if @cursors.right.isDown and ( Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x <= 0 )
            @body.velocity.x += @vStep
            facing = 'right'

        if @cursors.up.isDown and @body.touching.down
            @body.velocity.y = -@jumpVelocity
            @canceledJump = false
            
        if @cursors.up.isUp and @canceledJump is false and @body.velocity.y <= 0
            @body.velocity.y = 0
            @canceledJump = true
            
        # Determine if cat.
        if @cursors.up.isDown or @cursors.right.isDown or @cursors.left.isDown or @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR or @game.input.keyboard.isDown Phaser.Keyboard.X
            @cat = false

        # If shooting, fire?
        if @game.input.keyboard.isDown Phaser.Keyboard.X
            @fire()
        # If not, update his facing, and display the correct animation
        else
           @facing = facing

        if @facing is 'right'
            @scale.x = 1
        else if @facing is 'left'
            @scale.x = -1

        # Not moving
        if !@cursors.left.isDown and !@cursors.right.isDown and !@cursors.up.isDown
            if @body.velocity.x > 0
                @body.velocity.x -= 50
            else if @body.velocity.x < 0
                @body.velocity.x += 50

        if @body.velocity.x is 0 and @body.velocity.y is 0
            @animations.stop()
        else
            @animations.play 'right', 16, true

        return true

        

    # Fire his non-existent gun!
    fire: () ->
        # If it's been 80 ms since last bullet
        if @game.time.now > @nextBullet

            # See if there is a free bullet 
            bullet = Pigvane.Main.bullets.getFirstExists false

            # If there is one
            if bullet
                # Reset it to the dude's position
                bullet.reset @x, @y

                bullet.animations.frame = 2
                # Change velocity and position of bullet based on the way the dude is facing.  
                # Also knockback dude.
                
                if @facing is 'right'
                    bullet.body.velocity.x = 1000
                    @x -= 5 if !@body.touching.left
                else if @facing is 'left'
                    bullet.body.velocity.x = -1000
                    @x += 5 if !@body.touching.right

                # Randomise velocity
                bullet.body.velocity.x += @game.rnd.integerInRange(-100, 100)
                bullet.body.velocity.y += @game.rnd.integerInRange(-40, 40)

                # @game.world.camera.x += @game.rnd.integerInRange -20, 20
                # @game.world.camera.y += @game.rnd.integerInRange -20, 20

            # Next bullet can only be fired 80ms from now
            @nextBullet = @game.time.now + 80
            
    damage: () ->
        @health -=1
        if (@health == 0)
            @lives -=1
            if (@lives == 0)
                @kill()
                @game.state.start 'Restart'
            else
                @health = 3
        Pigvane.Main.healthBar.update()
