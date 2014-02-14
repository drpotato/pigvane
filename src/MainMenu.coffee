class Pigvane.States.MainMenu
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Add background + logo to current state
        @bg = @add.sprite -360, 12, 'menuBG'

        @logo = @add.sprite 198, 122, 'logo' 
        @logo.animations.add 'dropthebass', [0,1]
        @logo.animations.play 'dropthebass', 1.5, true
        
        @insertCoinText = @add.text(490, 500, "Insert Coin(s)", {
            font: '20px Emulogic',
            fill: 'DBB4A5',
            strokeThickness: 5,
            stroke: '3C033A',
            align: 'center'
            })

        
        @cursor = @add.text(375, 700, '>', {
            font: '20px Emulogic',
            fill: 'DBB4A5',
            strokeThickness: 5,
            stroke: '3C033A'
            })

        @options = [
            ['Press Start to Play', @fadeOut],
            ['Controls', @help]
        ]

        text = (opt[0]+'\n' for opt in @options).reduce (x,y) -> x + y

        @startText = @add.text(450, 700, text, {
            font: '20px Emulogic',
            fill: 'DBB4A5',
            strokeThickness: 5,
            stroke: '3C033A',
            align: 'center'
            })

        twitterText = '@freelyfred - lead dev\n@xxNxT - lead artist\n@dr__potato - project manager, dev'

        @twitter = @add.text(10, 944, twitterText, {
            font: '13px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A'
            })

        @input.keyboard.addCallbacks @, @keyDown

        @cursorPosition = 0

        @blinkTimer = 0

    update: () ->
        if @time.now > @blinkTimer
            @blinkTimer = @time.now + 400
            #@cursor.visible = !@cursor.visible
            #I don't think that this should blink - it's distracting.
            @insertCoinText.visible = !@insertCoinText.visible

    keyDown: (e) ->
        switch e.keyCode
            when Phaser.Keyboard.DOWN
                @updateCursor('down')
            when Phaser.Keyboard.UP
                @updateCursor('up')
            when Phaser.Keyboard.ENTER
                @selectOption()

    selectOption: () ->
        @options[@cursorPosition][1].call(this)

    updateCursor: (direction) ->
        switch direction
            when 'down'
                @cursorPosition++
                if @cursorPosition >= @options.length
                    @cursorPosition = 0
            when 'up'
                @cursorPosition--
                if @cursorPosition < 0
                    @cursorPosition = @options.length-1

        @cursor.y = 700 + 32 * @cursorPosition

    fadeOut: () ->
        # @add.tween(@background).to {alpha: 0}, 2000, Phaser.Easing.Linear.None, true
        # tween = @add.tween(@logo).to {alpha: 0}, 1000, Phaser.Easing.Linear.None, true
        @add.tween(@startText).to({alpha: 0}, 500,Phaser.Easing.Linear.None, true)
        tween = @add.tween(@cursor).to({alpha: 0}, 500,Phaser.Easing.Linear.None, true)

        # Once the animation completes
        tween.onComplete.add @startGame, this
        # @startGame()

    help: () ->
        @game.state.start 'Help'

    startGame: () ->
        # Go to the main game!
        @game.state.start 'Main'
