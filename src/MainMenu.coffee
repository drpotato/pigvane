class Pigvane.States.MainMenu
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Add background + logo to current state
        @background = @add.sprite 80, 120, 'titlepage'
        @logo = @add.sprite 300, 385, 'logo' 
        
        # Allows us to fade in background
        @background.alpha = 0

        # Fade in background and logo
        @add.tween(@background).to({ alpha: 1}, 2000, Phaser.Easing.Bounce.InOut, true);
        @add.tween(@logo).to({ y: 220 }, 2000, Phaser.Easing.Elastic.Out, true, 2000);

        # Go to `fadeOut` if any keys are pressed or the mouse is clicked
        @input.onDown.addOnce(@fadeOut, this);

    fadeOut: () ->
        @add.tween(@background).to {alpha: 0}, 2000, Phaser.Easing.Linear.None, true
        tween = @add.tween(@logo).to {alpha: 0}, 1000, Phaser.Easing.Linear.None, true

        # Once the animation completes
        tween.onComplete.add @startGame, this

    startGame: () ->
        # Go to the main game!
        @game.state.start 'Main'