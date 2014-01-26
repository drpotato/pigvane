class Pigvane.Classes.Dude extends Phaser.Sprite
    constructor: (@game, x, y) ->
        # Make sure sprite is actually created
        super game, x, y, 'dude'

        # Used in collisions
        @name = 'dude'
        
        # Has the dude moved?
        @moved = false
        
        # Generic NPC kills
        @kills
        
        # Special NPC Kills
        @specialKills = 0
        
        # Special NPC helps
        @helps = 0
        
        # Special NPC ignores
        @ignores = 0
        
        # Is a cat?
        @cat = true

        # Set up animations
        @animations.add 'right',[0,1,2,3]
        @animations.add 'jump', [4,5,6,7,8,9]
        @animations.add 'drawn', [10,11,12,13]
        # @animations.add 'left', [12,13,14,15]
        
        @animations.play 'right', 16, true

        # Set collision size
        @body.setSize 32, 32, 0, 0
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
        
        @health = 10

        @gunDrawn = false

        @aggro = 1

        @game.input.keyboard.addKey(Phaser.Keyboard.Z).onDown.add(@switchDrawnState, @)

    update: () ->
        @game.physics.collide @, Pigvane.Main.mainLayer
        if @game.input.keyboard.isDown Phaser.Keyboard.D
            Pigvane.Main.dlc.popup()

        # Set resulting speed of body
        @vStep = 50
        @velocity = 200
        @jumpVelocity = 300
        # More if running
        @velocity = 300 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR

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
            soundCallback = () ->
                Pigvane.Main.soundManager.sfxJump.play()
                
            setTimeout soundCallback, 150
            
        if @cursors.up.isUp and @canceledJump is false and @body.velocity.y <= 0
            @body.velocity.y = 0
            @canceledJump = true
            
        # Determine if cat.
        if @cursors.up.isDown or @cursors.right.isDown or @cursors.left.isDown or @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR or @game.input.keyboard.isDown Phaser.Keyboard.X
            @cat = false

        
        if @facing is 'right'
            @scale.x = 1
        else if @facing is 'left'
            @scale.x = -1

        if @game.input.keyboard.isDown Phaser.Keyboard.V
            @damage()
        

        # Not moving
        if !@cursors.left.isDown and !@cursors.right.isDown and !@cursors.up.isDown
            if Math.abs( @body.velocity.x ) < 50
                @body.velocity.x = 0
            if @body.velocity.x > 0
                @body.velocity.x -= 50
            else if @body.velocity.x < 0
                @body.velocity.x += 50

        # If shooting, fire?
        if @game.input.keyboard.isDown(Phaser.Keyboard.X) and @gunDrawn is true
            @fire()
            Pigvane.Main.soundManager.sfxGunshotPlayer.play()
        # If not, update his facing, and display the correct animation
        else
           @facing = facing


        if @body.velocity.x is 0 and @body.velocity.y is 0
            @animations.stop()
        else
            if @gunDrawn is true
                @animations.play 'drawn', 16, true
            else
                @animations.play 'right', 16, true
        
        @updateAchievements()

        Pigvane.Main.bgScroll.tilePosition.x = @game.world.camera.x/2.5
        Pigvane.Main.bgbgScroll.tilePosition.x = @game.world.camera.x/5
        
        return true

    switchDrawnState: () ->
        @gunDrawn = !@gunDrawn
        if @gunDrawn is true
            # @animations.play 'drawn', 16, true
            @animations.frame = 10
        else
            @animations.frame = 0
            # @animations.play 'right', 16, true

    hitByNPC: (obj1, obj2) ->
        obj2.kill()
        Pigvane.Main.dude.damage()

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

                bullet.animations.frame = 1
                # bullet.animations.play('shoot', 60)

                callback = () ->
                    bullet.animations.stop()
                    bullet.animations.play('repeat', 4, true)
                    bullet.animations.frame = if bullet.x % 2 == 0 then 2 else 3

                setTimeout callback, 17
                # Change velocity and position of bullet based on the way the dude is facing.  
                # Also knockback dude.
                
                if @facing is 'right'
                    bullet.body.velocity.x = 1000
                    @body.velocity.x -= 100 if Math.abs( @body.velocity.x - 100 ) <= @velocity
                else if @facing is 'left'
                    bullet.body.velocity.x = -1000
                    @body.velocity.x += 100 if Math.abs( @body.velocity.x - 100 ) <= @velocity

                # Randomise velocity
                bullet.body.velocity.x += @game.rnd.integerInRange(-100, 100)
                bullet.body.velocity.y += @game.rnd.integerInRange(-40, 40)

                # @game.world.camera.x += @game.rnd.integerInRange -20, 20
                # @game.world.camera.y += @game.rnd.integerInRange -20, 20

            # Next bullet can only be fired 80ms from now
            @nextBullet = @game.time.now + 80
            
    damage: () ->
        @health -=1
        if @health == 0
            Pigvane.Main.soundManager.sfxDeathScream.play()
            @respawn()
            @health = 10
            @lives--
            Pigvane.Main.healthBar.removeLife()
            if @lives == 0
                # @kill()
                
                # Pigvane.Main.achievements.grant('3_lives')
                
                console.log @game.state.states
                @game.state.start 'Restart'

        Pigvane.Main.healthBar.update()

    respawn: () ->
        @x = @game.world.camera.x + 50
        @y = 500
        
    updateAchievements: () ->
        
        if !@moved and @body.velocity.x != 0
            @moved = true
            Pigvane.Main.achievements.grant('first_steps')
            
        if @specialKills == 1
            Pigvane.Main.achievements.grant('kill_1')
