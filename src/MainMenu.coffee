class Pigvane.States.MainMenu
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Add background + logo to current state
        # @background = @add.sprite 80, 120, 'titlepage'
        @logo = @add.sprite 0, 100, 'logo' 
        @logo.animations.add 'dropthebass', [0,1]
        @logo.animations.play 'dropthebass', 2, true
        
        # Allows us to fade in background
        # @background.alpha = 0

        # Fade in background and logo
        # @add.tween(@background).to({ alpha: 1}, 2000, Phaser.Easing.Bounce.InOut, true);
        # @add.tween(@logo).to({ y: 220 }, 2000, Phaser.Easing.Elastic.Out, true, 2000);
        
        @startText = @game.add.text(240, 600, 'Press Enter to Play', {
            'font': '20px Emulogic',
            'fill': 'white'
            })

    update: () ->
        if @input.keyboard.isDown 13
            if !@fadedOut?
                @fadedOut = true
                @fadeOut()

    fadeOut: () ->
        # @add.tween(@background).to {alpha: 0}, 2000, Phaser.Easing.Linear.None, true
        # tween = @add.tween(@logo).to {alpha: 0}, 1000, Phaser.Easing.Linear.None, true
        tween = @add.tween(@startText).to({alpha: 0}, 1000,Phaser.Easing.Linear.None, true)

        # Once the animation completes
        tween.onComplete.add @startGame, this
        # @startGame()

    startGame: () ->
        # Go to the main game!
        @game.state.start 'Main'
