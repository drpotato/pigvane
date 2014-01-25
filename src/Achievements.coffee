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
        
        
    grant: (achivementName) ->
        
        achievementData = @achievementList[achievementName]
        
        achievement = @game.add.group()
        
        @achievements.add achievement._container
        
        achievement.height = 256
        achievement.width = 512
        achievement.x = @game.width - achievement.width
        achievement.y = @game.height
        
        background = achievement.create(0, 0, achievementData['img'])
        
        textSprite = @game.add.sprite(0, 0,)
        textSprite.fixedToCamera = true
        
        text = @game.add.text(20, 20, 'Achievement Text!')
        textSprite.addChild(text)
        
        text = achievement.add(textSprite)
        
        background.fixedToCamera = true
        text.fixedToCamera = true
        
        
        @game.add.tween(achievement).to({y: @game.height-achievement.height}, 1000, Phaser.Easing.Linear.None, true)
        
        callback = () -> 
            tween = Pigvane.Main.game.add.tween(achievement).to({y: Pigvane.Main.game.height}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                background.kill()
                )
        
        setTimeout callback, 3000