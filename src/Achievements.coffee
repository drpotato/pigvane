class Pigvane.Classes.Achievements
    constructor: (@game) ->
        
        @achievements = @game.add.group()
        
        @achievements.fixedToCamera = true
        
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
        
        @game.add.tween(achievement).to({y: -achievement.height}, 1000, Phaser.Easing.Linear.None, true);
        
        callback = () -> 
            Pigvane.Main.game.add.tween(achievement).to({y: achievement.height}, 1000, Phaser.Easing.Linear.None, true);
        
        setTimeout callback, 2000
        