class Pigvane.States.Preloader
    # `@game` automatically creates this.game
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->

        # Set up preloadBar using built-in methods
        @preloadBar = @add.sprite 128, 296, 'preload'
        @load.setPreloadSprite @preloadBar

        # Load game resources
        
        @game.load.tilemap 'city-tm', 'res/city-level.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.tileset 'city-ts', 'res/tiles-large.png', 32, 32
        @game.load.image 'city-bg', 'res/coolbackestround.png'
        @game.load.image 'city-bgScroll1', 'res/bg1-large.png'
        @game.load.image 'city-bgScroll2', 'res/bg2-large.png'


        @game.load.tilemap 'candy-tm', 'res/candyland-level.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.tileset 'candy-ts', 'res/candylandtiles-large.png', 32, 32
        @game.load.image 'candy-bg', 'res/candybase-large.png'
        @game.load.image 'candy-bgScroll1', 'res/candycanes3-large.png'
        @game.load.image 'candy-bgScroll2', 'res/candycanes1-large.png'

        @game.load.spritesheet 'lives', 'res/heart-large.png', 32, 32

        @game.load.image 'dialog', 'res/dialogue.png'

        @game.load.spritesheet 'dude', 'res/testwalking-large.png', 32, 32
        @game.load.spritesheet 'hat_npc', 'res/npc6-large.png', 32, 32

        @game.load.image 'scanlines', 'res/scanlines.png'
        
        @game.load.image 'city-vignette', 'res/vignette.png'
        @game.load.image 'candy-vignette', 'res/vignette.png'
        @game.load.image 'aggro-vignette', 'res/vignette_blood.png'

        @game.load.spritesheet 'bullet', 'res/bullet-large.png', 32, 32
        @game.load.spritesheet 'enemyBullet', 'res/bullet-large.png', 32, 32

        @game.load.image 'achievement_background', 'res/achievement.png'
        
        # Achievement Images
        @game.load.image 'achievement_3_lives', 'res/3lives.png'
        @game.load.image 'achievement_cats_can_play', 'res/catCanPlay.png'
        @game.load.image 'achievement_city_complete', 'res/CityComplete.png'
        @game.load.image 'achievement_copyright_violation', 'res/Copyright Violation.png'
        @game.load.image 'achievement_dlc', 'res/DLC.png'
        @game.load.image 'achievement_first_steps', 'res/first steps.png'
        @game.load.image 'achievement_first_blood', 'res/FirstBlood.png'
        @game.load.image 'achievement_help_candy_crusher', 'res/HelpCandyCrusher.png'
        @game.load.image 'achievement_help_cat', 'res/HelpCat.png'
        @game.load.image 'achievement_help_fruit_ninja', 'res/HelpFruitNinja.png'
        @game.load.image 'achievement_help_kid', 'res/HelpKid.png'
        @game.load.image 'achievement_help_monk', 'res/HelpMonk.png'
        @game.load.image 'achievement_help_old_man', 'res/HelpOldMan.png'
        @game.load.image 'achievement_help_pig_owner', 'res/HelpPigOwner.png'
        @game.load.image 'achievement_help_sick_pig', 'res/HelpSickPig.png'
        @game.load.image 'achievement_kill_candy_crusher', 'res/KillCandyCrusher.png'
        @game.load.image 'achievement_kill_cat', 'res/KillCat.png'
        @game.load.image 'achievement_kill_fruit_ninja', 'res/KillFruitNinja.png'
        @game.load.image 'achievement_kill_kid', 'res/KillKid.png'
        @game.load.image 'achievement_kill_monk', 'res/KillMonk.png'
        @game.load.image 'achievement_kill_old_man', 'res/KillOldMan.png'
        @game.load.image 'achievement_kill_pig_owner', 'res/KillPigOwner.png'
        @game.load.image 'achievement_kill_sick_pig', 'res/KillSickPig.png'
        @game.load.image 'achievement_sunshine_rainbows', 'res/sunshineRainbows.png'
        @game.load.image 'achievement_finish_wind', 'res/concordance.png'
        @game.load.image 'achievement_first_free', 'res/FirstOneFree.png'
        @game.load.image 'achievement_finish_pig', 'res/greed.png'
        @game.load.image 'achievement_finish_human', 'res/Loneliness.png'
        @game.load.image 'achievement_pacifist', 'res/pacifist.png'
        
        # NPCs
        # - City
        @game.load.spritesheet 'npc_oldman', 'res/oldman-large.png', 32, 32
        @game.load.spritesheet 'npc_pig_girl', 'res/piggirl-large.png', 64, 32
        @game.load.spritesheet 'npc_monk', 'res/monk-large.png', 32, 32
        @game.load.spritesheet 'npc_ice_cream_girl', 'res/icecreamgirl-large.png', 32, 32
        # - Candy
        @game.load.spritesheet 'npc_candy_crusher', 'res/candycrusher-large.png', 64, 32
        @game.load.spritesheet 'npc_kitty', 'res/kitty-large.png', 32, 32
        @game.load.spritesheet 'npc_fruit_ninja', 'res/fruitninja-large.png', 32, 32
        @game.load.spritesheet 'npc_angry_pig_green', 'res/angrypig-green-large.png', 32, 32
        

        # Music
        @game.load.audio 'circus_music', 'res/circus_music.mp3'
        @game.load.audio 'city_music', 'res/city_music_1.mp3'
        
        # SFX
        @game.load.audio 'sfx_jump', 'res/Jump.mp3'
        @game.load.audio 'sfx_gunshot_player', 'res/PlayerGunshot.mp3'
        @game.load.audio 'sfx_gunshot_enemy', 'res/EnemyGunshot.mp3'
        @game.load.audio 'sfx_death_scream', 'res/DeathScream.mp3'
        @game.load.audio 'sfx_collectable', 'res/Collectable.mp3'
        
        # Load title screen resources
        # @game.load.image 'titlepage', 'res/rickroll.jpg'
        @game.load.spritesheet 'logo', 'res/title-large.png', 896, 256
        @game.load.image 'menuBG', 'res/background-large.png'

    create: () ->
        # Animate the preloadBar
        tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true);
        # When it completes, go to `startMainMenu`
        tween.onComplete.add(@startMainMenu, this);
        
    startMainMenu: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'MainMenu'
