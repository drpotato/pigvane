class Pigvane.States.Help
    constructor: (@game) ->
        

    preload: () ->
        @title = @add.text(475, 400, "Controls", {
            font: '40px Emulogic'
            fill: 'white'
            })

        @controlText = "joystick - movement \n \
        z - change weapon \n \
        x - shoot \n \
        \
        "

        @controls = @add.text(480, 500, @controlText, {
            font: '15px Emulogic'
            fill: 'white',
            align: 'center'
            })