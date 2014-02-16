class Pigvane.States.HighScore
    constructor: (@game) ->
       
    preload: () ->
        
        @bg = @add.sprite -360, 12, 'submenuBG'
        
        @title = @add.text(380, 400, "High Scores", {
            font: '80px Emulogic'
            fill: '8D5074'
            })

        @highScorePlayersText = @add.text(480, 500, "", {
            font: '40px Emulogic'
            fill: '8D5074',
            align: 'left'
            })

        @highScoreText = @add.text(700, 500, "", {
            font: '40px Emulogic'
            fill: '8D5074',
            align: 'left'
            })

        @input.keyboard.addKey(Phaser.Keyboard.ESC).onDown.add(@exit, @)

        @blinkTimer = 0

        @renderScores()

    renderScores: () ->
        @highScoresPlayers = ""
        @highScores = ""

        for entry in Pigvane.highscores
            console.log "Adding: " + entry.name + ": " + entry.score
            @highScoresPlayers += entry.name + ")\n"
            @highScores += entry.score + "\n"

        console.log @highScoresPlayers
        console.log @highscores

        @highScorePlayersText.setText @highScoresPlayers
        @highScoreText.setText @highScores

        @scoreThreshold = Pigvane.highscores[Pigvane.highscores.length-1].score



    create: () ->
        console.log @scoreThreshold
        if Pigvane.score > @scoreThreshold
            @signals = {}
            @signals.UP = @input.keyboard.addKey(Phaser.Keyboard.UP)
            @signals.DOWN = @input.keyboard.addKey(Phaser.Keyboard.DOWN)
            
            @signals.LEFT = @input.keyboard.addKey(Phaser.Keyboard.LEFT)
            @signals.RIGHT = @input.keyboard.addKey(Phaser.Keyboard.RIGHT)
            
            @signals.UP.onDown.add(@decrementCursor, @)
            @signals.DOWN.onDown.add(@incrementCursor, @)
            @signals.LEFT.onDown.add(@moveCursor, @)  
            @signals.RIGHT.onDown.add(@moveCursor, @)

            @newScore = {}
            @newScore.player = "   "
            @newScore.score = Pigvane.score
            @newScore.position = @findPosition(@newScore.score)
            
            @signals.ENTER = @input.keyboard.addKey(Phaser.Keyboard.ENTER)
            setTimeout( $.proxy(() -> 
                @signals.ENTER.onDown.add(@confirmScore, @)
            , this) , 1000)

            @cursorPosition = 0

            @insertScore(@newScore.position, "", @newScore.score)
            @renderScores()

            @blink = true

            @newHighScorePlayer = @add.text(560, 500 + 27*@newScore.position, @newScore.player, {
                font: '40px Emulogic'
                fill: '8D5074'
            })
            @newHighScoreCursor = @add.text(560, 500 + 27*@newScore.position, "_", {
                font: '40px Emulogic'
                fill: '8D5074'
            })
            @updateCursorPosition()


    update: () ->
        if @blink
            if @time.now > @blinkTimer
                @blinkTimer = @time.now + 400
                @newHighScoreCursor.visible = !@newHighScoreCursor.visible

    incrementCursor: () ->
        currentLetter = @newScore.player[@cursorPosition].charCodeAt(0)

        if currentLetter == 32
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(97))
        else if currentLetter < 122
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(currentLetter + 1))
        else if currentLetter == 122
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(32))
        @updateNewHighScoreText()

    decrementCursor: () ->
        currentLetter = @newScore.player[@cursorPosition].charCodeAt(0)

        if currentLetter == 32
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(122))
        else if currentLetter > 97
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(currentLetter - 1))
        else if currentLetter == 97
            @newScore.player = @newScore.player.replaceAt(@cursorPosition, String.fromCharCode(32))
        @updateNewHighScoreText()

    moveCursor: (key) ->
        if key.keyCode == 39
            @cursorPosition++
        else if key.keyCode == 37
            @cursorPosition--

        if @cursorPosition > 2
            @cursorPosition = 0
        if @cursorPosition < 0
            @cursorPosition = 2

        @updateCursorPosition()

    confirmScore: () ->
        @newHighScoreCursor.destroy()
        @newHighScorePlayer.destroy()
        for k,v of @signals
            v.onDown.removeAll()
            delete @signals[k]

        @updateScore(@newScore.position, @newScore.player, @newScore.score)
        @renderScores()
        @exit()


    updateCursorPosition: () ->
        @newHighScoreCursor.x = 560 + 20*@cursorPosition

    updateNewHighScoreText: () ->
        @newHighScorePlayer.setText(@newScore.player)

    insertScore: (index, text = "", score = 0) ->
        $.ajax
            url: 'enter_score?name=' + text + '&score=' + score
            async: false

    updateScore: (index, text, score = 0) ->
        Pigvane.highscores[index] = {'name':text, 'score':score}

    findPosition: (score) ->
        for entry, i in Pigvane.highscores
            if score > entry.score
                return i

    exit: () ->
        @game.state.start('MainMenu')