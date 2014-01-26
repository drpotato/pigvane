class Pigvane.Classes.Achievements
    constructor: (@game) ->
        
        @numberAchievements = 0
        
        @achievementList = {
            'free': {
                'name': 'The First One\'s Free',
                'img': 'achievement_first_free'
            },
            'cat_playable': {
                'name': 'Even Cats Can Play',
                'img': 'achievement_cats_can_play'
            },
            'first_steps': {
                'name': 'First Steps',
                'img': 'achievement_first_steps'
            },
            
            '3_lives': {
                'name': 'You Only Live Thrice',
                'img': 'achievement_3_lives'
            },
            
            'dlc': {
                'name': 'I Love Horse Armor',
                'img': 'achievement_dlc'
            },
            
            'kill_1': {
                'name': 'Say Hello To My Little Friend!',
                'img': 'achievement_first_blood'
            }, 
            
            'pacifist': {
                'name': 'It\'s All Sunshine and Rainbows',
                'img': 'achievement_sunshine_rainbows'
            },
            
            'suburbs_complete': {
                'name': 'Concrete Jungle',
                'img': 'achievement_city_complete'
            },
            
            'candyland_complete': {
                'name': 'Copyright Violation',
                'img': 'achievement_copyright_violation'
            },
            
            'old_man_kill': {
                'name': 'Euthanasia Enthusiast'
                'img': 'achievement_kill_old_man'
            },
            
            'old_man_help': {
                'name': 'Let There Be Sight!'
                'img': 'achievement_help_old_man'
            },
            
            'kid_kill': {
                'name': 'Yuck 9mm flavour'
                'img': 'achievement_kill_kid'
            },
            
            'kid_help': {
                'name': 'Diabetes Enabler'
                'img': 'achievement_help_kid'
            },
            
            'pig_owner_kill': {
                'name': 'Makin\' some bacon'
                'img': 'achievement_kill_pig_owner'
            },
            
            'pig_owner_help': {
                'name': 'Lipstick on a Pig'
                'img': 'achievement_help_pig_owner'
            },
            
            'monk_kill': {
                'name': 'No Yin, Only Yang'
                'img': 'achievement_kill_monk'
            },
            
            'monk_help': {
                'name': 'Enlightened'
                'img': 'achievement_help_monk'
            },
            
            'crusher_kill': {
                'name': 'Better Lawyer Up'
                'img': 'achievement_kill_candy_crusher'
            },
            
            'crusher_help': {
                'name': 'Delicious!'
                'img': 'achievement_help_candy_crusher'
            },
            
            'cat_kill': {
                'name': 'Schrodinger\'s cat'
                'img': 'achievement_kill_cat'
            },
            
            'cat_help': {
                'name': 'Time For Adventure!'
                'img': 'achievement_help_cat'
            },
            
            'sick_pig_kill': {
                'name': 'Green Eggs and Ham'
                'img': 'achievement_kill_sick_pig'
            },
            
            'sick_pig_help': {
                'name': 'At Least There\'s No Birds'
                'img': 'achievement_help_sick_pig'
            },
            
            'ninja_kill': {
                'name': 'Gun Beats Sword'
                'img': 'achievement_kill_fruit_ninja'
            },
            
            'ninja_help': {
                'name': 'Fruit Massacre'
                'img': 'achievement_help_fruit_ninja'
            },
            
            'red_kill': {
                'name': 'Lamb to the Slaughter'
                'img': ''
            },
            
            'red_help': {
                'name': 'Wolf in Sheep\'s Clothes'
                'img': ''
            },
            
            'squirrel_kill': {
                'name': 'Part of the Janitor\'s Collection'
                'img' : ''
            },
            
            'squirrel_help': {
                'name': 'What Innuendo?'
                'img' : ''
            },
            
            'yogi_kill': {
                'name': 'Bear got a Boo-boo'
                'img': ''
            },
            
            'yogi_help': {
                'name': 'Pic-a-nic Basket'
                'img': ''
            },
            
            'sonic_kill': {
                'name': 'No Rings Left'
                'img': ''
            },
            
            'sonic_help': {
                'name': 'Running Like The Wind'
                'img': ''
            },
            
            'human_end': {
                'name': 'Loneliness'
                'img': 'achievement_finish_human'
            },
            
            'cat_end': {
                'name': 'Indifference'
                'img': 'achievement_cats_can_play'
            },
            
            'wind_end': {
                'name': 'Concordance'
                'img': 'achievement_finish_wind'
            },
            
            'pig_end': {
                'name': 'Greed'
                'img': 'achievement_finish_pig'
            }
        }
            
        
        
        achievementCallback = () ->
            Pigvane.Main.achievements.grant('free')
            
        setTimeout achievementCallback, 1000
        
        endCallback = () ->
            Pigvane.levelController.currentLevelIndex = 2
            Pigvane.levelController.loadLevel()
        
        achievementCallback = () ->
            if Pigvane.Main.dude.cat
                Pigvane.Main.achievements.grant('cat_playable')
                
                setTimeout endCallback, 3000
                
        setTimeout achievementCallback, 30000
        
    grant: (achievementName) ->
        
        if !@achievementList[achievementName]['granted']
            @achievementList[achievementName]['granted'] = true
            
            @numberAchievements += 1
            
            achievementData = @achievementList[achievementName]
            
            achievement = @game.add.group()
            
            achievement.height = 100
            achievement.width = 350
            achievement.x = @game.width - achievement.width
            achievement.y = @game.height
            
            background = achievement.create(0, 0, 'achievement_background')
            
            imageWrapperSprite = @game.add.sprite(0,0)
            imageSprite = @game.add.sprite(25, 25, achievementData['img'])
            
            imageWrapperSprite.addChild(imageSprite)
            
            textSprite = @game.add.sprite(0, 0)
            textSprite.fixedToCamera = true
            
            textTitle = @game.add.bitmapText(100, 10, 'Achievement Unlocked!', {'font': '16pt pixelFont', 'fill': 'white', 'wordWrap': true, 'wordWrapWidth': 100 })
            textName = @game.add.bitmapText(100, 40, achievementData['name'], {'font': '12pt pixelFont', 'fill': 'white', 'wordWrap': true, 'wordWrapWidth': 100 })
            textSprite.addChild(textTitle)
            textSprite.addChild(textName)
            
            text = achievement.add(textSprite)
            image = achievement.add(imageWrapperSprite)
            
            background.fixedToCamera = true
            text.fixedToCamera = true
            image.fixedToCamera = true
            
            
            @game.add.tween(achievement).to({y: @game.height-achievement.height * @numberAchievements}, 1000, Phaser.Easing.Linear.None, true)
            
            callback = () -> 
                tween = Pigvane.Main.game.add.tween(achievement).to({alpha: 0}, 3000, Phaser.Easing.Linear.None, true)
                tween.onComplete.add( () ->
                    achievement.destroy()
                    Pigvane.Main.achievements.numberAchievements -= 1
                    )
            
            setTimeout callback, 3000