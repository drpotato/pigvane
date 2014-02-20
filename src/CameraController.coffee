class Pigvane.Classes.CameraController
    constructor: (@game) ->
        @camera = @game.world.camera
        @dude = @game.Main.dude
        @screenShakeTimer = 0

        @game.Main.onUpdate.add @update, @

        @frozen = false

    update: () ->

        if !@frozen
            xCamera = @camera.x + @game.width/2 + if @dude.facing == 'left' then 150 else -150
            yCamera = @camera.y + @game.height/2

            xDude = @dude.body.x + @dude.body.width/2
            yDude = @dude.body.y + @dude.body.height/2

            if @screenShakeTimer > @game.time.now
                if @dude.facing == 'left'
                    @camera.x += @game.rnd.integerInRange 5, 10
                else 
                    @camera.x += @game.rnd.integerInRange -10, -5
                


            # if (xDude - xCamera > 128 or xCamera - xDude > 128)
            @camera.x += (xDude - xCamera) / 15

            # if (@dude.body.y - @camera.y > 128 or @camera.y - @dude.body.y > 128)
            @camera.y += (yDude - yCamera) / 15

        return true


    shakeScreen: () ->
        @screenShakeTimer = @game.time.now + 100

    reset: () ->
        @frozen = true
        @camera.x = 0