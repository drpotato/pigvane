class Pigvane.States.MainMenu
    # `@game` automatically creates this.game
    constructor: (@game) ->

    preload: () ->
        # Add background + logo to current state
        if twoplayer?
            @bg = @add.sprite -360, -138, 'menuBG'
        else
            @bg = @add.sprite -360, 12, 'menuBG'

        console.log @bg

        @game.stage.backgroundColor = "#222"

        @logo = @add.sprite 198, 122, 'logo' 
        if twoplayer? then @logo.y -= 150
        @logo.animations.add 'dropthebass', [0,1]
        @logo.animations.play 'dropthebass', 1.5, true
        
        @insertCoinText = @add.text(490, 500, "Insert Coin(s)", {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A',
            align: 'center'
            })

        if twoplayer?
            @insertCoinText.visible = false
        
        @cursor = @add.text(400, 700, '>', {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A'
            })

        if twoplayer? 
            @options = [
                ['Press Start to Play', @fadeOut],
                ['About & Help', @help],
                ['High Scores', @highscore],
                ['Switch to 2 Player', @twoplayer]
            ]
        else
            @options = [
                ['Press Start to Play', @fadeOut],
                ['About & Help', @help],
                ['High Scores', @highscore],
                ['Switch to 2 Player', @twoplayer]
            ]

        text = (opt[0]+'\n' for opt in @options).reduce (x,y) -> x + y

        @startText = @add.text(435, 700, text, {
            font: '40px Emulogic',
            fill: '8D5074',
            strokeThickness: 0,
            stroke: '3C033A',
            align: 'center'
            })

        if twoplayer? then @startText.y = 300

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
            if !twoplayer?
                @insertCoinText.visible = !@insertCoinText.visible

    keyDown: (e) ->
        if @capture == true
            if @game.secondGame?
                switch e.keyCode
                    when Phaser.Keyboard.S
                        @updateCursor('down')
                    when Phaser.Keyboard.W
                        @updateCursor('up')
                    when Phaser.Keyboard.E
                        @selectOption()
            else
                switch e.keyCode
                    when Phaser.Keyboard.DOWN
                        @updateCursor('down')
                    when Phaser.Keyboard.UP
                        @updateCursor('up')
                    when Phaser.Keyboard.ENTER
                        @selectOption()

    selectOption: () ->
        @capture = false
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
        @game.state.start 'HighScore'

    startGame: () ->
        # Go to the main game!
        console.log @game.currentLevel
        @game.state.start 'Level1'
