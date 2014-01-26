class Pigvane.Classes.End
    
    constructor: (@game) ->
        
        @endings = [
            {
            'img': '',
            'msg': 'You are a pig.'
            },{
            'img': '',
            'msg': 'You are a cat.'
            },{
            'img': '',
            'msg': 'You are a dog.'
            },{
            'img': '',
            'msg': 'You are a fish.'
            },{
            'img': '',
            'msg': 'You are a bird.'
            }
        ]
    
    start: () ->
        
        if Pigvane.Main.dude.kills == 0 and Pigvane.Main.dude.specialKills == 0
            Pigvane.Main.achievements.grant('pacifist')
        
        @ending = @endings[@game.rnd.integerInRange(0, 4)]