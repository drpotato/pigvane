class Pigvane.Classes.Dude extends Phaser.Sprite
    constructor: (@game, x, y) ->
        # Make sure sprite is actually created
        super game, x, y, 'dude'

        # Used in collisions
        @name = 'dude'

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

    update: () ->
        @game.physics.collide @, Pigvane.Main.mainLayer

        # Reset body
        # @body.velocity.x = 0    

        # Set resulting speed of body
        @vStep = 50
        @velocity = 300
        @jumpVelocity = 450
        # More if running
        @velocity = 700 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR

        # Less if shooting
        @velocity = 100 if @game.input.keyboard.isDown Phaser.Keyboard.X 

        # Series of ifs to change dude velocity if arrow keys are pressed
        if @cursors.left.isDown and ( Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x >= 0 )
            @body.velocity.x -= @vStep
            facing = 'left'
            @scale.x = -1
        else if @cursors.right.isDown and ( Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x <= 0 )
            @body.velocity.x += @vStep
            facing = 'right'
            @scale.x = 1

        if @cursors.up.isDown and @body.touching.down
            @body.velocity.y = -@jumpVelocity
            @canceledJump = false
            
        if @game.input.keyboard.isDown Phaser.Keyboard.A
            Pigvane.Main.achievements.grant('free')            
            
        if @cursors.up.isUp and @canceledJump is false and @body.velocity.y <= 0
            @body.velocity.y = 0
            @canceledJump = true

        # If shooting, fire?
        #if @game.input.keyboard.isDown Phaser.Keyboard.X
            # @fire()
        # If not, update his facing, and display the correct animation
        # else
        #    @facing = facing

        # Not moving
        if !@cursors.left.isDown and !@cursors.right.isDown and !@cursors.up.isDown
            if @body.velocity.x > 0
                @body.velocity.x -= 50
            else if @body.velocity.x < 0
                @body.velocity.x += 50

        if @body.velocity.x is 0 and @body.velocity.y is 0
            @animations.stop()
        else
            @animations.play 'jump', 16, true

        return true

        

    # Fire his non-existent gun!
    fire: () ->
        # If it's been 80 ms since last bullet
        if @game.time.now > @nextBullet

            # See if there is a free bullet 
            bullet = Pigvane.Main.groups.bulletsGroup.getFirstExists false

            # If there is one
            if bullet
                # Reset it to the dude's position
                bullet.reset @x, @y
                # Change velocity and position of bullet based on the way the dude is facing.  
                # Also knockback dude.
                

                # Randomise velocity
                bullet.body.velocity.x += @game.rnd.integerInRange(-100, 100)
                bullet.body.velocity.y += @game.rnd.integerInRange(-100, 100)

            # Next bullet can only be fired 80ms from now
            @nextBullet = @game.time.now + 80