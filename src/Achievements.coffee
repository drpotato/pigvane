class Pigvane.Classes.Achievements
    constructor: (@game) ->
        
        @achievements = @game.add.group()
        
        @achievementList = {
            'first is free': {
                'title': 'first',
                'text': 'hello, world!',
                'img': '/path/to/image'
            }
        }
        
        
    grant: () ->
        
        achievement = @game.add.group()
        
        @achievements.add achievement._container
        
        achievement.height = 256
        achievement.width = 512
        
        background = achievement.create(@game.width - achievement.width, @game.height, 'achievement_background')
        
        background.fixedToCamera = true
        
        
        @game.add.tween(achievement).to({y: -achievement.height}, 1000, Phaser.Easing.Linear.None, true)
        
        callback = () -> 
            tween = Pigvane.Main.game.add.tween(achievement).to({y: achievement.height}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                background.kill()
                )
        
        setTimeout callback, 3000