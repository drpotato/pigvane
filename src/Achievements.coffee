class Pigvane.Classes.Achievements
    constructor: (@game) ->
        
        @achievements = @game.add.group()
        
        @achievementList = {
            'free': {
                'name': 'The First One is Free',
                'img': ''
            },
            'cat_playable': {
                'name': 'Even Cats Can Play',
                'img': ''
            }
        }
        
        achievementCallback = () ->
            Pigvane.Main.achievements.grant('free')
            
        setTimeout achievementCallback, 1000
        
        achievementCallback = () ->
            if Pigvane.Main.dude.cat
                Pigvane.Main.achievements.grant('cat_playable')
                
        setTimeout achievementCallback, 30000
        
    grant: (achievementName) ->
        
        achievementData = @achievementList[achievementName]
        
        achievement = @game.add.group()
        
        @achievements.add achievement._container
        
        achievement.height = 96
        achievement.width = 192
        achievement.x = @game.width - achievement.width
        achievement.y = @game.height
        
        background = achievement.create(0, 0, 'achievement_background')
        
        textSprite = @game.add.sprite(0, 0)
        textSprite.fixedToCamera = true
        
        textTitle = @game.add.text(20, 5, 'Achievement Unlocked!', {'font': '12pt Arial'})
        textName = @game.add.text(20, 50, achievementData['name'], {'font': '12pt Arial', 'fill': 'white'})
        textSprite.addChild(textTitle)
        textSprite.addChild(textName)
        
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