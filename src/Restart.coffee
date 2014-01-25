class Pigvane.States.Restart
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->
        @game.stage.backgroundColor = '#000'

        @text = @game.add.bitmapText 200, 250, 'You Died', {
            'font': '120px pixelFont',
            'fill': 'white'
        }

        @restartText = @game.add.bitmapText(300, 600, 'Please click to restart', {
            'font': '30px pixelFont',
            'fill': 'white'
            })

        @input.onDown.addOnce(@fadeOut, this)

    fadeOut: () ->
        @add.tween(@text).to {alpha: 0}, 2000, Phaser.Easing.Linear.None, true
        tween = @add.tween(@restartText).to {alpha: 0}, 2000, Phaser.Easing.Linear.None, true

        tween.onComplete.add @restart, this
        
    restart: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'Main'

