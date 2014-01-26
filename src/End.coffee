class Pigvane.Classes.End
    
    constructor: (@game) ->
        
        @endings = [
            {
            'img': '',
            'msg': 'Here your journey ends\n and once again nobody is there for you.\n Not one soul even acknowledged you.\n\n Did you really make a difference, or did you just think you did?'
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
    
    start: () ->
        
        if Pigvane.Main.dude.kills == 0 and Pigvane.Main.dude.specialKills == 0
            Pigvane.Main.achievements.grant('pacifist')
        
        @ending = @endings[@game.rnd.integerInRange(0, 4)]