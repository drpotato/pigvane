class Pigvane.States.Preloader
    # `@game` automatically creates this.game
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->

        # Set up preloadBar using built-in methods
        @preloadBar = @add.sprite 512, 312, 'preload'
        @load.setPreloadSprite @preloadBar

        # Load game resources
        
        # Tilemap and bg
        @game.load.image 'tiles', 'res/citytiles-2x.png'
        # @game.load.image    'lvl1-fg',          'res/level1/foreground-2x.png'

        # LEVEL 1
        @game.load.tilemap  'lvl1-tm',          'res/level1.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image    'lvl1-bg',          'res/level1/cloudlayer-2x.png'
        @game.load.image    'lvl1-bgScroll1',   'res/level1/bg1-2x.png'
        @game.load.image    'lvl1-bgScroll2',   'res/level1/bg2-2x.png'
        @game.load.image    'lvl1-floor',       'res/level1/floorforeground-2x.png'
        @game.load.image    'lvl1-gun_pistol',  'res/level1/gun2-2x.png'
        @game.load.image    'lvl1-gun_shotgun', 'res/level1/gun4-2x.png'
        @game.load.image    'lvl1-gun_smg',     'res/level1/gun1-2x.png'
        @game.load.image    'lvl1-gun_minigun', 'res/level1/gun3-2x.png'
        @game.load.image    'lvl1-platform.1',  'res/level1/platform1-2x.png'
        @game.load.image    'lvl1-platform.2',  'res/level1/platform2-2x.png'
        @game.load.image    'lvl1-platform.3',  'res/level1/platform3-2x.png'
        @game.load.spritesheet 'lvl1-dude',     'res/level1/char-blue-2x.png', 48, 48
        @game.load.spritesheet 'lvl1-npc',      'res/level1/ninjamaster-2x.png', 48, 48

        # LEVEL 2
        @game.load.tilemap  'lvl2-tm',          'res/level2.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image    'lvl2-bg',          'res/level2/level2-cloudlayer-2x.png'
        @game.load.image    'lvl2-bgScroll1',   'res/level2/level2-bg1-2x.png'
        @game.load.image    'lvl2-bgScroll2',   'res/level2/level2-bg2-2x.png'
        @game.load.image    'lvl2-floor',       'res/level2/level2-floorforeground-2x.png'
        @game.load.image    'lvl2-gun_pistol',  'res/level2/gun2-pink-2x.png'
        @game.load.image    'lvl2-gun_shotgun', 'res/level2/gun4-pink-2x.png'
        @game.load.image    'lvl2-gun_smg',     'res/level2/gun1-pink-2x.png'
        @game.load.image    'lvl2-gun_minigun', 'res/level2/gun3-pink-2x.png'
        @game.load.image    'lvl2-platform.1',  'res/level2/level2-platform1-2x.png'
        @game.load.image    'lvl2-platform.2',  'res/level2/level2-platform2-2x.png'
        @game.load.image    'lvl2-platform.3',  'res/level2/level2-platform3-2x.png'
        @game.load.spritesheet 'lvl2-dude',     'res/level2/char-pink-2x.png', 48, 48
        @game.load.spritesheet 'lvl2-npc',      'res/level2/ninjamaster-pink-2x.png', 48, 48
        
        # LEVEL 3
        @game.load.tilemap  'lvl3-tm',          'res/level3.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image    'lvl3-bg',          'res/level3/level3-cloudlayer-2x.png'
        @game.load.image    'lvl3-bgScroll1',   'res/level3/level3-bg1-2x.png'
        @game.load.image    'lvl3-bgScroll2',   'res/level3/level3-bg2-2x.png'
        @game.load.image    'lvl3-floor',       'res/level3/level3-floorforeground-2x.png'
        @game.load.image    'lvl3-gun_pistol',  'res/level3/gun2-red-2x.png'
        @game.load.image    'lvl3-gun_shotgun', 'res/level3/gun4-red-2x.png'
        @game.load.image    'lvl3-gun_smg',     'res/level3/gun1-red-2x.png'
        @game.load.image    'lvl3-gun_minigun', 'res/level3/gun3-red-2x.png'
        @game.load.image    'lvl3-platform.1',  'res/level3/level3-platform1-2x.png'
        @game.load.image    'lvl3-platform.2',  'res/level3/level3-platform2-2x.png'
        @game.load.image    'lvl3-platform.3',  'res/level3/level3-platform3-2x.png'
        @game.load.spritesheet 'lvl3-dude',     'res/level3/char-red-2x.png', 48, 48
        @game.load.spritesheet 'lvl3-npc',      'res/level3/ninjamaster-red-2x.png', 48, 48
        
        # LEVEL 4
        @game.load.tilemap  'lvl4-tm',          'res/level4.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image    'lvl4-bg',          'res/level4/level4-cloudlayer-2x.png'
        @game.load.image    'lvl4-bgScroll1',   'res/level4/level4-bg1-2x.png'
        @game.load.image    'lvl4-bgScroll2',   'res/level4/level4-bg2-2x.png'
        @game.load.image    'lvl4-floor',       'res/level4/level4-floorforeground-2x.png'
        @game.load.image    'lvl4-gun_pistol',  'res/level4/gun2-yellow-2x.png'
        @game.load.image    'lvl4-gun_shotgun', 'res/level4/gun4-yellow-2x.png'
        @game.load.image    'lvl4-gun_smg',     'res/level4/gun1-yellow-2x.png'
        @game.load.image    'lvl4-gun_minigun', 'res/level4/gun3-yellow-2x.png'
        @game.load.image    'lvl4-platform.1',  'res/level4/level4-platform1-2x.png'
        @game.load.image    'lvl4-platform.2',  'res/level4/level4-platform2-2x.png'
        @game.load.image    'lvl4-platform.3',  'res/level4/level4-platform3-2x.png'
        @game.load.spritesheet 'lvl4-dude',     'res/level4/char-yellow-2x.png', 48, 48
        @game.load.spritesheet 'lvl4-npc',      'res/level4/ninjamaster-yellow-2x.png', 48, 48
        
        # LEVEL 5
        @game.load.tilemap  'lvl5-tm',          'res/level5.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image    'lvl5-bg',          'res/level5/level5-cloudlayer-2x.png'
        @game.load.image    'lvl5-bgScroll1',   'res/level5/level5-bg1-2x.png'
        @game.load.image    'lvl5-bgScroll2',   'res/level5/level5-bg2-2x.png'
        @game.load.image    'lvl5-floor',       'res/level5/level5-floorforeground-2x.png'
        @game.load.image    'lvl5-gun_pistol',  'res/level5/gun2-purple-2x.png'
        @game.load.image    'lvl5-gun_shotgun', 'res/level5/gun4-purple-2x.png'
        @game.load.image    'lvl5-gun_smg',     'res/level5/gun1-purple-2x.png'
        @game.load.image    'lvl5-gun_minigun', 'res/level5/gun3-purple-2x.png'
        @game.load.image    'lvl5-platform.1',  'res/level5/level5-platform1-2x.png'
        @game.load.image    'lvl5-platform.2',  'res/level5/level5-platform2-2x.png'
        @game.load.image    'lvl5-platform.3',  'res/level5/level5-platform3-2x.png'
        @game.load.spritesheet 'lvl5-dude',     'res/level5/char-purple-2x.png', 48, 48
        @game.load.spritesheet 'lvl5-npc',      'res/level5/ninjamaster-purple-2x.png', 48, 48
        
        
        # Platforms
        

        # Health
        @game.load.image 'lives', 'res/heart-2x.png', 128, 128
        @game.load.image 'healthBar', 'res/healthbar-2x.png'

        # Dialog Box
        @game.load.image 'dialog', 'res/dialogue.png'

        # Bullets + guns
        @game.load.spritesheet 'bullet', 'res/bullet-2x.png', 32, 32
        @game.load.spritesheet 'enemyBullet', 'res/bullet-2x.png', 32, 32

        # NPCs
        # - City
        @game.load.spritesheet 'npc_oldman', 'res/oldman-2x.png', 32, 32
        @game.load.spritesheet 'npc_pig_girl', 'res/piggirl-2x.png', 64, 32
        @game.load.spritesheet 'npc_monk', 'res/monk-2x.png', 32, 32
        @game.load.spritesheet 'npc_ice_cream_girl', 'res/icecreamgirl-2x.png', 32, 32
        # - Candy
        # @game.load.spritesheet 'npc_candy_crusher', 'res/candycrusher-2x.png', 64, 32
        @game.load.spritesheet 'npc_kitty', 'res/kitty-2x.png', 32, 32
        @game.load.spritesheet 'npc_fruit_ninja', 'res/fruitninja-2x.png', 32, 32
        # @game.load.spritesheet 'npc_angry_pig_green', 'res/angrypig-green-2x.png', 32, 32
        

        # Music
        @game.load.audio 'music', 'res/pigvane_music.wav'
        
        # SFX
        @game.load.audio 'sfx_jump', 'res/Jump.mp3'
        @game.load.audio 'sfx_gunshot_player', 'res/gun.wav'
        @game.load.audio 'sfx_gunshot_player_pistol', 'res/pistol_shot.wav'
        @game.load.audio 'sfx_gunshot_enemy', 'res/EnemyGunshot.mp3'
        @game.load.audio 'sfx_death_scream', 'res/DeathScream.mp3'
        @game.load.audio 'sfx_collectable', 'res/Collectable.mp3'
        @game.load.audio 'sfx_heartbeat', 'res/heartbeat.wav'
        
        # Load title screen resources
        # @game.load.image 'titlepage', 'res/rickroll.jpg'
        @game.load.spritesheet 'logo', 'res/title-2x.png', 896, 256
        @game.load.image 'menuBG', 'res/background-2x.png'
        @game.load.image 'submenuBG', 'res/menubackground-2x.png'
        

    create: () ->
        # Animate the preloadBar
        tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true);
        # When it completes, go to `startMainMenu`
        tween.onComplete.add(@startMainMenu, this);
        
    startMainMenu: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'MainMenu'
