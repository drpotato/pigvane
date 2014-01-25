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
        
        @ending = @endings[@game.rnd.integerInRange(0, 5)]