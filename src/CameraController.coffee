class Pigvane.Classes.CameraController
    constructor: (game) ->
        @game = game
        @camera = @game.world.camera
        @dude = Pigvane.Main.dude

    update: () ->

        if (@dude.body.x - @camera.x > 128 or @camera.x - @dude.body.x > 128)
            @camera.x += @dude.body.x + @dude.body.width/2 - @camera.x - @game.width/2

        if (@dude.body.y - @camera.y > 128 or @camera.y - @dude.body.y > 128)
            @camera.y += @dude.body.y + @dude.body.height/2 - @camera.y - @game.height/2
