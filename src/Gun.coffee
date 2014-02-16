class Pigvane.Classes.Gun extends Phaser.Sprite
    constructor: (@game, x=0, y=0) ->
        super @game, x, y, 'gun_pistol'

        @anchor.setTo 1, 0.5

        @visible = false

        Pigvane.Main.onUpdate.add @update, @

    update: () ->
        dude = Pigvane.Main.dude
        @x = dude.x - 2
        @y = dude.y + 13

        if dude.facing == "right"
            @scale.x = -1
        else if dude.facing == "left"
            @scale.x = 1

    setSprite: (key) ->
        @key = key