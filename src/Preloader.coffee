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

        @game.load.tilemap 'candy-tm', 'res/candylandtest.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.tileset 'candy-ts', 'res/candylandtiles-large.png', 32, 32

        @game.load.image 'bgScroll', 'res/bg1-large.png'
        @game.load.image 'bgbgScroll', 'res/bg2-large.png'

        @game.load.spritesheet 'lives', 'res/heart-large.png', 32, 32

        @game.load.image 'achievement_background', 'res/achievement.png'

        @game.load.image 'dialog', 'res/dialogue.png'

        @game.load.spritesheet 'dude', 'res/testwalking-large.png', 32, 32
        @game.load.spritesheet 'hat_npc', 'res/npc6-large.png', 32, 32

        @game.load.image 'scanlines', 'res/scanlines.png'
        @game.load.image 'vignette', 'res/vignette.png'

        @game.load.spritesheet 'bullet', 'res/bullet-large.png', 32, 32
        @game.load.spritesheet 'enemyBullet', 'res/bullet-large.png', 32, 32
        
        # NPCs
        @game.load.spritesheet 'npc_oldman', 'res/oldman-large.png', 32, 32
        @game.load.spritesheet 'npc_pig_girl', 'res/piggirl-large.png', 32, 32
        @game.load.spritesheet 'npc_monk', 'res/monk-large.png', 32, 32
        @game.load.spritesheet 'npc_ice_cream_girl', 'res/icecreamgirl-large.png', 32, 32

        # Music
        @game.load.audio 'ambient_city_music', 'res/ambient_city_music.mp3'
        @game.load.audio 'ambient_candy_music', 'res/ambient_candy_music.mp3'
        @game.load.audio 'city_music', 'res/city_music_1.mp3'
        @game.load.audio 'circus_music', 'res/circus_music.mp3'
        @game.load.audio 'forest_music', 'res/forest_music.mp3'
        @game.load.audio 'ambient_forest_music', 'res/ambient_forest_music.mp3'
        
        # SFX
        @game.load.audio 'sfx_jump', 'res/jump2.mp3'
        @game.load.audio 'sfx_gunshot_player', 'res/PlayerGunshot.mp3'
        @game.load.audio 'sfx_gunshot_enemy', 'res/EnemyGunshot.mp3'
        @game.load.audio 'sfx_death_scream', 'res/DeathScream.mp3'
        @game.load.audio 'sfx_collectable', 'res/Collectable.mp3'

        @game.load.bitmapFont 'pixelfont', 'res/pixelFont.png', 'res/pixelFont.xml'
        
        # Load title screen resources
        # @game.load.image 'titlepage', 'res/rickroll.jpg'
        # @game.load.image 'logo', 'res/ea.jpg'

    create: () ->
        # Animate the preloadBar
        tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true);
        # When it completes, go to `startMainMenu`
        tween.onComplete.add(@startMainMenu, this);
        
    startMainMenu: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'MainMenu'
