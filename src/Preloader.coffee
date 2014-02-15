class Pigvane.States.Preloader
    # `@game` automatically creates this.game
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->

        # Set up preloadBar using built-in methods
        @preloadBar = @add.sprite 320, 464, 'preload'
        @load.setPreloadSprite @preloadBar

        # Load game resources
        
        @game.load.tilemap 'city-tm', 'res/citylevel.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image 'citytiles', 'res/citytiles-2x.png'
        @game.load.image 'city-bg', 'res/cloudlayer-2x.png'
        @game.load.image 'city-bgScroll1', 'res/newbg1-2x.png'
        @game.load.image 'city-bgScroll2', 'res/bg2-2x.png'
        @game.load.image 'city-fg', 'res/foreground-2x.png'
        
        @game.load.image 'platform.1', 'res/platform1-2x.png'
        @game.load.image 'platform.2', 'res/platform2-2x.png'
        @game.load.image 'platform.3', 'res/platform3-2x.png'

        @game.load.image 'lives', 'res/heart-2x.png', 128, 128
        @game.load.image 'healthBar', 'res/healthbar-2x.png'

        @game.load.image 'dialog', 'res/dialogue.png'

        @game.load.spritesheet 'dude', 'res/char-blue-2x.png', 48, 48
        @game.load.spritesheet 'hat_npc', 'res/npc6-2x.png', 32, 32

        @game.load.spritesheet 'bullet', 'res/bullet-2x.png', 32, 32
        @game.load.spritesheet 'enemyBullet', 'res/bullet-2x.png', 32, 32

        @game.load.image 'achievement_background', 'res/achievement.png'
        
        # Achievement Images
        @game.load.image 'achievement_3_lives', 'res/achievement/3lives.png'
        @game.load.image 'achievement_cats_can_play', 'res/achievement/catCanPlay.png'
        @game.load.image 'achievement_city_complete', 'res/achievement/CityComplete.png'
        @game.load.image 'achievement_copyright_violation', 'res/achievement/Copyright Violation.png'
        @game.load.image 'achievement_dlc', 'res/achievement/DLC.png'
        @game.load.image 'achievement_first_steps', 'res/achievement/first steps.png'
        @game.load.image 'achievement_first_blood', 'res/achievement/FirstBlood.png'
        @game.load.image 'achievement_help_candy_crusher', 'res/achievement/HelpCandyCrusher.png'
        @game.load.image 'achievement_help_cat', 'res/achievement/HelpCat.png'
        @game.load.image 'achievement_help_fruit_ninja', 'res/achievement/HelpFruitNinja.png'
        @game.load.image 'achievement_help_kid', 'res/achievement/HelpKid.png'
        @game.load.image 'achievement_help_monk', 'res/achievement/HelpMonk.png'
        @game.load.image 'achievement_help_old_man', 'res/achievement/HelpOldMan.png'
        @game.load.image 'achievement_help_pig_owner', 'res/achievement/HelpPigOwner.png'
        @game.load.image 'achievement_help_sick_pig', 'res/achievement/HelpSickPig.png'
        @game.load.image 'achievement_kill_candy_crusher', 'res/achievement/KillCandyCrusher.png'
        @game.load.image 'achievement_kill_cat', 'res/achievement/KillCat.png'
        @game.load.image 'achievement_kill_fruit_ninja', 'res/achievement/KillFruitNinja.png'
        @game.load.image 'achievement_kill_kid', 'res/achievement/KillKid.png'
        @game.load.image 'achievement_kill_monk', 'res/achievement/KillMonk.png'
        @game.load.image 'achievement_kill_old_man', 'res/achievement/KillOldMan.png'
        @game.load.image 'achievement_kill_pig_owner', 'res/achievement/KillPigOwner.png'
        @game.load.image 'achievement_kill_sick_pig', 'res/achievement/KillSickPig.png'
        @game.load.image 'achievement_sunshine_rainbows', 'res/achievement/sunshineRainbows.png'
        @game.load.image 'achievement_finish_wind', 'res/achievement/concordance.png'
        @game.load.image 'achievement_first_free', 'res/achievement/FirstOneFree.png'
        @game.load.image 'achievement_finish_pig', 'res/achievement/greed.png'
        @game.load.image 'achievement_finish_human', 'res/achievement/Loneliness.png'
        @game.load.image 'achievement_pacifist', 'res/achievement/pacifist.png'
        
        # NPCs
        # - City
        @game.load.spritesheet 'npc_oldman', 'res/oldman-2x.png', 32, 32
        @game.load.spritesheet 'npc_pig_girl', 'res/piggirl-2x.png', 64, 32
        @game.load.spritesheet 'npc_monk', 'res/monk-2x.png', 32, 32
        @game.load.spritesheet 'npc_ice_cream_girl', 'res/icecreamgirl-2x.png', 32, 32
        @game.load.spritesheet 'npc_ninja_master', 'res/ninjamaster-2x.png', 48, 48
        # - Candy
        # @game.load.spritesheet 'npc_candy_crusher', 'res/candycrusher-2x.png', 64, 32
        @game.load.spritesheet 'npc_kitty', 'res/kitty-2x.png', 32, 32
        @game.load.spritesheet 'npc_fruit_ninja', 'res/fruitninja-2x.png', 32, 32
        # @game.load.spritesheet 'npc_angry_pig_green', 'res/angrypig-green-2x.png', 32, 32
        

        # Music
        # @game.load.audio 'circus_music', 'res/circus_music.mp3'
        # @game.load.audio 'city_music', 'res/city_music_1.mp3'
        
        # SFX
        @game.load.audio 'sfx_jump', 'res/Jump.mp3'
        @game.load.audio 'sfx_gunshot_player', 'res/gun.wav'
        @game.load.audio 'sfx_gunshot_player_pistol', 'res/pistol_shot.wav'
        @game.load.audio 'sfx_gunshot_enemy', 'res/EnemyGunshot.mp3'
        @game.load.audio 'sfx_death_scream', 'res/DeathScream.mp3'
        @game.load.audio 'sfx_collectable', 'res/Collectable.mp3'
        
        # Load title screen resources
        # @game.load.image 'titlepage', 'res/rickroll.jpg'
        @game.load.spritesheet 'logo', 'res/title-2x.png', 896, 256
        @game.load.image 'menuBG', 'res/background-2x.png'

    create: () ->
        # Animate the preloadBar
        tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true);
        # When it completes, go to `startMainMenu`
        tween.onComplete.add(@startMainMenu, this);
        
    startMainMenu: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'MainMenu'
