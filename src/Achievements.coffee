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
            },
            'first_steps': {
                'name': 'First Steps',
                'img': ''
            },
            
            '3_lives': {
                'name': 'You Only Live Thrice',
                'img': ''
            },
            
            'dlc': {
                'name': 'I Love Horse Armor',
                'img': ''
            },
            
            'kill_1': {
                'name': 'Say Hello To My Little Friend',
                'img': ''
            }, 
            
            'pacifist': {
                'name': 'It\'s All Sunshine and Rainbows',
                'img': ''
            },
            
            'suburbs_complete': {
                'name': 'A Dream On Oak Road',
                'img': ''
            },
            
            'candyland_complete': {
                'name': 'Copyright Violation',
                'img': ''
            },
            
            'old_man_kill': {
                'name': 'Euthanasia Enthusiast'
                'img': ''
            },
            
            'old_man_help': {
                'name': 'Let There Be Sight!'
                'img': ''
            },
            
            'kid_kill': {
                'name': 'Yuck 9mm flavour'
                'img': ''
            },
            
            'kid_help': {
                'name': 'Diabetes Enabler'
                'img': ''
            },
            
            'pig_owner_kill': {
                'name': 'Makin\' some bacon'
                'img': ''
            },
            
            'pig_owner_help': {
                'name': 'Lipstick on a Pig'
                'img': ''
            },
            
            'monk_kill': {
                'name': 'No Yin, Only Yang'
                'img': ''
            },
            
            'monk_help': {
                'name': 'Enlightened'
                'img': ''
            },
            
            'crusher_kill': {
                'name': 'Better Lawyer Up'
                'img': ''
            },
            
            'crusher_help': {
                'name': 'Delicious!'
                'img': ''
            },
            
            'cat_kill': {
                'name': 'Schrodinger\'s cat'
                'img': ''
            },
            
            'cat_help': {
                'name': 'Time For Adventure!'
                'img': ''
            },
            
            'sick_pig_kill': {
                'name': 'Green Eggs and Ham'
                'img': ''
            },
            
            'sick_pig_help': {
                'name': 'At Least There\'s No Birds'
                'img': ''
            },
            
            'ninja_kill': {
                'name': 'Gun Beats Sword'
                'img': ''
            },
            
            'ninja_help': {
                'name': 'Fruit Massacre'
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
        
        achievement.height = 100
        achievement.width = 250
        achievement.x = @game.width - achievement.width
        achievement.y = @game.height
        
        background = achievement.create(0, 0, 'achievement_background')
        
        textSprite = @game.add.sprite(0, 0)
        textSprite.fixedToCamera = true
        
        textTitle = @game.add.text(20, 5, 'Achievement Unlocked!', {'font': '12pt Arial', 'fill': 'white'})
        textName = @game.add.text(20, 30, achievementData['name'], {'font': '8pt Arial', 'fill': 'white', 'wordWrap': true, 'wordWrapWidth': 200 })
        textSprite.addChild(textTitle)
        textSprite.addChild(textName)
        
        text = achievement.add(textSprite)
        
        background.fixedToCamera = true
        text.fixedToCamera = true
        
        
        @game.add.tween(achievement).to({y: @game.height-achievement.height}, 1000, Phaser.Easing.Linear.None, true)
        
        callback = () -> 
            tween = Pigvane.Main.game.add.tween(achievement).to({y: Pigvane.Main.game.height}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                achievement.destroy()
                )
        
        setTimeout callback, 3000