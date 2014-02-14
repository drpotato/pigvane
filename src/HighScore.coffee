class Pigvane.States.HighScore
    constructor: (@game) ->
       
    preload: () ->
        @title = @add.text(475, 400, "High Scores", {
            font: '40px Emulogic'
            fill: 'white'
            })

        @highScoresPlayers = ""
        @highScores = ""

        for score, i in Pigvane.highscores
            @highScoresPlayers += (i+1) + ") " + score[0] + "\n"
            @highScores += score[1] + "\n"

        @highScorePlayersText = @add.text(540, 500, @highScoresPlayers, {
            font: '15px Emulogic'
            fill: 'white',
            align: 'right'
            })

        @highScoreText = @add.text(720, 500, @highScores, {
            font: '15px Emulogic'
            fill: 'white',
            align: 'left'
            })

        @input.keyboard.addKey(Phaser.Keyboard.ESC).onDown.add(@exit, @)

    exit: () ->
        @game.state.start('MainMenu')