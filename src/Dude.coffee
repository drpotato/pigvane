class Pigvane.Classes.Dude extends Phaser.Sprite
    constructor: (@game, x, y) ->
        # Make sure sprite is actually created
        super game, x, y, 'dude'

        # Used in collisions
        @name = 'dude'

        # Set up animations
        @animations.add 'down', [0,1,2,3]
        @animations.add 'up',   [4,5,6,7]
        @animations.add 'right',[8,9,10,11]
        @animations.add 'left', [12,13,14,15]
        
        # Default frame
        @animations.frame = 0

        # Set collision size
        @body.setSize 32, 16, 0, 16
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        # Set up some game cursors for later
        @cursors = @game.input.keyboard.createCursorKeys()

        # Next time a bullet can be fired, used in `fire()`
        @nextBullet = 0

        # Fixes a bug where a person shoots without moving
        @facing = 'down'

    update: () ->
        # Reset body
        @body.velocity.x = 0
        @body.velocity.y = 0

        # Set resulting speed of body
        @velocity = 150
        # More if running
        @velocity = 300 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR
        # Less if shooting
        @velocity = 100 if @game.input.keyboard.isDown Phaser.Keyboard.X 

        # Series of ifs to change dude velocity if arrow keys are pressed
        if @cursors.left.isDown
            @body.velocity.x = -@velocity / 1.4142
            facing = 'left'
        else if @cursors.right.isDown
            @body.velocity.x = @velocity / 1.4142
            facing = 'right'

        if @cursors.up.isDown
            @body.velocity.y = -@velocity / 1.4142
            facing = 'up'
        else if @cursors.down.isDown
            @body.velocity.y = @velocity / 1.4142
            facing = 'down'

        # If shooting, fire?
        if @game.input.keyboard.isDown Phaser.Keyboard.X
            @fire()
        # If not, update his facing, and display the correct animation
        else
            @facing = facing
            @animations.play @facing, 8, true

        # Not moving
        if @cursors.left.isUp and @cursors.right.isUp and @cursors.up.isUp and @cursors.down.isUp and !@game.input.keyboard.isDown Phaser.Keyboard.X
            @animations.stop()

    # Called from `Main`, handles collision with enemy
    hitByEnemy: () ->
        # If alive
        if @health > 0
            @health -= 0.1
            # If health drops below 0
            if @health <= 0
                console.log 'ded'
                # Go to the restart screen
                @game.start 'Restart'

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
                switch @facing
                    when 'up'
                        bullet.body.velocity.y = -800
                        bullet.y -= 22
                        @body.y +=3 
                    when 'down'
                        bullet.body.velocity.y = 800
                        bullet.y += 22
                        @body.y -=3
                    when 'left'
                        bullet.body.velocity.x = -800
                        bullet.x -= 22
                        @body.x +=3
                    when 'right'
                        bullet.body.velocity.x = 800
                        bullet.x += 22
                        @body.x -=3
                # Randomise velocity
                bullet.body.velocity.x += @game.rnd.integerInRange(-100, 100)
                bullet.body.velocity.y += @game.rnd.integerInRange(-100, 100)

            # Next bullet can only be fired 80ms from now
            @nextBullet = @game.time.now + 80