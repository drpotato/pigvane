class Pigvane.Classes.Dude extends Phaser.Sprite
    constructor: (@game, x, y) ->
        # Make sure sprite is actually created
        super @game, x, y, Pigvane.Main.config.prefix+'dude'

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

        @heartbeat = false

        # Set up animations
        @animations.add 'walk', [0,1,2,3,4,5,6,7]

        @animations.play 'walk', 16, true

        # Set collision size
        # @body.setRectangle 18, 48, 16, 0 # Broken in 1.1.4
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        # Set up some game cursors for later
        @cursors = @game.input.keyboard.createCursorKeys()

        # Next time a bullet can be fired, used in `fire()`
        @nextBullet = 0

        @facing = 'right'

        @body.gravity.y = 1000

        @lives = 3

        @maxHealth = 10
        @health = 10

        @gunDrawn = false

        @aggro = 0
        @recentAggro = 0
        @aggroUpdateTimer = 0

        @body.bounce.y = 0.01

        @gun = Pigvane.Main.gun

        @game.input.keyboard.addKey(Phaser.Keyboard.Z).onDown.add(@switchDrawnState, @)

    update: () ->

        @game.physics.collide @, Pigvane.Main.mainLayer
        
        if @game.input.keyboard.isDown Phaser.Keyboard.D
            Pigvane.Main.dlc.popup()

        # Set resulting speed of body
        @vStep = 15
        @jumpVelocity = 550
        @velocity = 300

        # More if running
        @velocity = 450 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR
        @vStep = 50 if @game.input.keyboard.isDown Phaser.Keyboard.SPACEBAR

        # Less if shooting
        @velocity = 100 if @game.input.keyboard.isDown Phaser.Keyboard.X

        facing = @facing

        # Series of ifs to change dude velocity if arrow keys are pressed
        if @cursors.left.isDown
            if Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x >= 0
                @body.velocity.x = 0 if @body.velocity.x >= 0
                @body.velocity.x -= @vStep
                facing = 'left'
        else if @cursors.right.isDown
            if Math.abs( @body.velocity.x ) + @vStep <= @velocity or @body.velocity.x <= 0
                @body.velocity.x = 0 if @body.velocity.x <= 0
                @body.velocity.x += @vStep
                facing = 'right'

        if @cursors.up.isDown
            if @body.onFloor()
                @body.velocity.y = -@jumpVelocity
                @canceledJump = false
                soundCallback = () ->
                    # Pigvane.Main.soundManager.sfxJump.play()

                setTimeout soundCallback, 150

        if @canceledJump is false
            if @cursors.up.isUp and @body.velocity.y <= 0
                @body.velocity.y = 0
                @canceledJump = true

        if @facing is 'right'
            @scale.x = 1
        else if @facing is 'left'
            @scale.x = -1

        if @game.input.keyboard.isDown Phaser.Keyboard.V
            @damage()

        if @body.velocity.x is 0 and @body.velocity.y is 0
            @animations.stop()
        else
            if @gunDrawn is true
                @animations.play 'walk', 16, true
            else
                @animations.play 'walk', 16, true

        # Not moving
        if !@cursors.left.isDown and !@cursors.right.isDown and !@cursors.up.isDown
            if Math.abs( @body.velocity.x ) < 30
                @body.velocity.x = 0
            if @body.velocity.x > 0
                @body.velocity.x -= 30
            else if @body.velocity.x < 0
                @body.velocity.x += 30

        # If shooting, fire?
        if @game.input.keyboard.isDown(Phaser.Keyboard.X) and @gunDrawn is true
            @fire()
            
        # If not, update his facing, and display the correct animation
        else
           @facing = facing        

        if @health < 4 and !@heartbeat and !Pigvane.Main.soundManager.sfxHeartbeat.isPlaying
            Pigvane.Main.soundManager.sfxHeartbeat.play()
            @heartbeat = true
        else if @health > 3 and @heartbeat and Pigvane.Main.soundManager.sfxHeartbeat.isPlaying
            Pigvane.Main.soundManager.sfxHeartbeat.stop()
            @heatbeat = false

        if @game.time.now > @aggroUpdateTimer
            @aggroUpdateTimer = @game.time.now + 1000
            @recentAggro -= 2 if @recentAggro > 2
            Pigvane.Main.aggroHelper.updateOverlay()

    switchDrawnState: () ->
        @gunDrawn = !@gunDrawn
        Pigvane.Main.weaponHandler.toggleOverlay()
        @gun.visible = @gunDrawn

    hitByNPC: (obj1, obj2) ->
        obj2.kill()
        Pigvane.Main.dude.damage()

    # Fire his non-existent gun!
    fire: () ->
        # If it's been 80 ms since last bullet
        if @game.time.now > @nextBullet

            # See if there is a free bullet
            bullet = Pigvane.Main.bullets.getFirstExists( false )

            # If there is one
            if bullet
                # Reset it to the dude's position
                bullet.reset @x, @y+10

                bullet.animations.frame = 0
                # bullet.animations.play('repeat', 4, true)
                
                currentWeapon = Pigvane.Main.weaponHandler.getCurrentWeapon()

                callback = () ->
                    bullet.animations.stop()
                    bullet.animations.play('repeat', 60, true)
                    bullet.animations.frame = if bullet.x % 2 == 0 then 1 else 2

                setTimeout callback, 17
                # Change velocity and position of bullet based on the way the dude is facing.
                # Also knockback dude.x
                if @facing is 'right'
                    bullet.body.velocity.x = currentWeapon.velocity
                    @body.velocity.x -= 100 if Math.abs( @body.velocity.x - 100 ) <= @velocity

                else if @facing is 'left'
                    bullet.body.velocity.x = -currentWeapon.velocity
                    @body.velocity.x += 100 if Math.abs( @body.velocity.x + 100 ) <= @velocity

                # Randomise velocity
                bullet.body.velocity.x += @game.rnd.integerInRange(-10, 10)
                if @body.onFloor()
                    bullet.body.velocity.y += @game.rnd.integerInRange(10, -10)
                else
                    bullet.body.velocity.y += @game.rnd.integerInRange(20, -40)

                # Next bullet can only be fired 80ms from now
                @nextBullet = @game.time.now + currentWeapon.fireRate

                Pigvane.Main.soundManager.sfxGunshotPlayer.play()

            Pigvane.Main.cameraController.shakeScreen()

    incAggro: (aggro) ->
        @aggro += aggro
        @recentAggro += aggro
        Pigvane.Main.aggroHelper.update()

    damage: () ->
        @health -=1
        if @health == 0
            Pigvane.Main.soundManager.sfxDeathScream.play()
            @respawn()
            @health = @maxHealth
            @lives--
            Pigvane.Main.healthBar.removeLife()
            if @lives == 0
                # @kill()
                Pigvane.Main.cameraController.reset()
                @game.state.start 'HighScore'

        Pigvane.Main.healthBar.update()

    respawn: () ->
        @x = @game.world.camera.x + 50
        @y = 500

    addText: (text, colour='white', size=10) ->
        text = @game.add.text(@x-10, @y, text, {
            font: size+'px Emulogic',
            fill: colour,
            strokeThickness: 5,
            stroke: '3C033A'
            })

        tween = @game.add.tween(text).to({y: text.y-100, alpha: 0}, 500, Phaser.Easing.Linear.None, true)

        tween.onComplete.add -> text.destroy()
