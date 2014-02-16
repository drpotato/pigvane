class Pigvane.States.Help
    constructor: (@game) ->
        

    preload: () ->
        
        @bg = @add.sprite -360, 12, 'submenuBG'
        
        @title = @add.text(525, 400, "About", {
            font: '80px Emulogic'
            fill: '8D5074'
            })

        @controlText = "joystick - movement \n \
        z - change weapon \n \
        x - shoot \n \
        \n \
        A game by @xxnxt, @freelyfred, and @dr__potato\n \
        Made for #Semiarcade, 2014\n \
        pigvane.com \n \
        \
        "

        @controls = @add.text(145, 500, @controlText, {
            font: '40px Emulogic'
            fill: '8D5074',
            align: 'center'
            })

        @input.keyboard.addKey(Phaser.Keyboard.ESC).onDown.add(@exit, @)

    exit: () ->
        @game.state.start('MainMenu')