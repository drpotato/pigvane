class Pigvane.Classes.End
    
    constructor: (@game) ->
        
        @endings = [
            {
            'img': '',
            'msg': 'Here your journey ends\n and yet again, nobody is there for you.\n Not one soul even acknowledged you.\n\n Did you really make a difference, or did you just think you did?'
            },{
            'img': '',
            'msg': 'Right and wrong...\n Just words from different perspectives.\n In the end, did any of it matter? \n\n Probably not'
            },{
            'img': '',
            'msg': 'Your journey has reached it\'s conclusion.\n Your actions changed the world\n but in the end, there is only you. \n\nAnd you are alone.'
            },{
            'img': '',
            'msg': 'The end was always an inevitability.\nYour journey was full of choice,\nyet you remain the same. \n\nWhat does the journey matter if nothing has changed?'
            }
        ]

    preload: () ->
        @game.stage.backgroundColor = "#000000"

        @game.world.camera.x = 0

        @game.add.text(300, 100, 'End', {
            font: '128px Emulogic',
            fill: 'white'
            })

        @msg = @endings[@game.rnd.integerInRange(0,3)].msg

        @game.add.text(250, 300, @msg, {
            font: '16px Emulogic',
            fill: 'white'
            align: 'center'
            width:  '896px'
            })

    start: () ->
        
        if Pigvane.Main.dude.kills == 0 and Pigvane.Main.dude.specialKills == 0
            Pigvane.Main.achievements.grant('pacifist')
        
        @ending = @endings[@game.rnd.integerInRange(0, 4)]