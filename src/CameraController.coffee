class Pigvane.Classes.CameraController
    constructor: (@game) ->
        @camera = @game.world.camera
        @dude = Pigvane.Main.dude
        @screenShakeTimer = 0

    update: () ->

        xCamera = @camera.x + @game.width/2 +  if @dude.facing == 'left' then 100 else -100
        yCamera = @camera.y + @game.height/2

        xDude = @dude.body.x + @dude.body.width/2
        yDude = @dude.body.y + @dude.body.height/2

        if @screenShakeTimer > @game.time.now
            @camera.x += @game.rnd.integerInRange -10, 10


        # if (xDude - xCamera > 128 or xCamera - xDude > 128)
        @camera.x += (xDude - xCamera) / 30

        # if (@dude.body.y - @camera.y > 128 or @camera.y - @dude.body.y > 128)
        @camera.y += (yDude - yCamera) / 30


    shakeScreen: () ->
        @screenShakeTimer = @game.time.now + 100