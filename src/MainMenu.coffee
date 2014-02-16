class Pigvane.States.MainMenu
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Add background + logo to current state
        @bg = @add.sprite -360, 12, 'menuBG'

        @game.stage.backgroundColor = "#222"

        @logo = @add.sprite 198, 122, 'logo' 
        @logo.animations.add 'dropthebass', [0,1]
        @logo.animations.play 'dropthebass', 1.5, true
        
        @insertCoinText = @add.text(490, 500, "Insert Coin(s)", {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A',
            align: 'center'
            })

        
        @cursor = @add.text(400, 700, '>', {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A'
            })

        @options = [
            ['Press Start to Play', @fadeOut],
            ['About & Help', @help],
            ['High Scores', @highscore]
        ]

        text = (opt[0]+'\n' for opt in @options).reduce (x,y) -> x + y

        @startText = @add.text(435, 700, text, {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A',
            align: 'center'
            })

        twitterText = '@freelyfred - lead programmer\n@xxNxT - artist & designer\n@dr__potato - programming & audio'

        @twitter = @add.text(10, 900, twitterText, {
            font: '30px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A'
            })

        @input.keyboard.addCallbacks @, @keyDown

        @capture = true

        @cursorPosition = 0

        @blinkTimer = 0

    update: () ->
        if @time.now > @blinkTimer
            @blinkTimer = @time.now + 400
            @insertCoinText.visible = !@insertCoinText.visible

    keyDown: (e) ->
        if @capture == true
            switch e.keyCode
                when Phaser.Keyboard.DOWN
                    @updateCursor('down')
                when Phaser.Keyboard.UP
                    @updateCursor('up')
                when Phaser.Keyboard.ENTER
                    @selectOption()

    selectOption: () ->
        Pigvane.weapon = -1
        Pigvane.score = 0
        Pigvane.level = 1
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
        # @add.tween(@startText).to({alpha: 0}, 500,Phaser.Easing.Linear.None, true)
        # tween = @add.tween(@cursor).to({alpha: 0}, 500,Phaser.Easing.Linear.None, true)

        # Once the animation completes
        # tween.onComplete.add @startGame, this
        @startGame()

    help: () ->
        @game.state.start 'Help'

    highscore: () ->
        @capture = false
        @game.state.start 'HighScore'

    startGame: () ->
        # Go to the main game!
        console.log Pigvane.currentLevel
        @game.state.start 'Level1'
