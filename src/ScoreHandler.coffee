class Pigvane.Classes.scoreHandler
    constructor: (@game) ->

        @recentScore = 0
        @recentTimer = 0

        @scoreText = @game.add.text(1700,5, "0", {
            font: '40px Emulogic',
            fill: 'white',
            strokeThickness: 5,
            stroke: '3C033A'
            })

        @recentScoreText = @game.add.text(1700,55, "", {
            font: '40px Emulogic',
            fill: 'white',
            strokeThickness: 5,
            stroke: '3C033A'
            })

        @scoreFloaters = @game.add.group()

        @scoreText.fixedToCamera = true
        @recentScoreText.fixedToCamera = true

        @onScoreUpdate = new Phaser.Signal()

        Pigvane.Main.onUpdate.add @update, @

    update: () ->

        if @recentScore == 0
            @recentScoreText.setText("")

        if @recentTimer < @game.time.now && @recentScore > 0

            Pigvane.score += 1
            @recentScore -= 1

        @scoreText.setText(Pigvane.score)

        @recentScoreText.setText(@recentScore)

        @onScoreUpdate.dispatch()

        return true

        # If you want the score to follow him
        # @scoreText.x = Pigvane.Main.dude.x-150
        # @scoreText.y = Pigvane.Main.dude.y-96

    add: (add) ->
        @recentScore += add
        @recentTimer = @game.time.now + 2000

        # Removed floating score for now...
        # @addFloatingText('+'+add)
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

