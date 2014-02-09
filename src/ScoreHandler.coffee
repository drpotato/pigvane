class Pigvane.Classes.scoreHandler
    constructor: (@game) ->

        @scoreText = @game.add.text(1700,5, "0", {
            font: '40px Emulogic',
            fill: 'white',
            strokeThickness: 5,
            stroke: '3C033A'
            })

        @scoreFloaters = @game.add.group()

        @scoreText.fixedToCamera = true

        # Pigvane.Main.onUpdate.add @update, @

    update: () ->

        @scoreText.setText(Pigvane.score)

        # If you want the score to follow him
        # @scoreText.x = Pigvane.Main.dude.x-150
        # @scoreText.y = Pigvane.Main.dude.y-96

    add: (add) ->
        Pigvane.score += add

        @addFloatingText('+'+add)
        @update()

        

    set: (score) ->
        Pigvane.score = score
        @update()

    remove: (remove) ->
        Pigvane.score -= remove
        if Pigvane.score < 0
            Pigvane.score = 0
        @addFloatingText('-'+remove, 'red')
        @update()

    addFloatingText: (text, colour='green') ->
        text = @game.add.text(Pigvane.Main.dude.x-10, Pigvane.Main.dude.y, text, {
            font: '10px Emulogic',
            fill: colour,
            strokeThickness: 5,
            stroke: '3C033A'
            })

        tween = @game.add.tween(text).to({y: text.y-100, alpha: 0}, 500, Phaser.Easing.Linear.None, true)

        tween.onComplete.add -> text.destroy()
        @scoreFloaters.add text

