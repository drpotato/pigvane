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
        @game.load.tilemap 'city-tm', 'res/citylevel.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.image 'citytiles', 'res/citytiles-2x.png'
        @game.load.image 'city-bg', 'res/cloudlayer-2x.png'
        @game.load.image 'city-bgScroll1', 'res/bg1-2x.png'
        @game.load.image 'city-bgScroll2', 'res/bg2-2x.png'
        @game.load.image 'city-fg', 'res/foreground-2x.png'
        @game.load.image 'floor', 'res/floorforeground-2x.png'
        
        # Platforms
        @game.load.image 'platform.1', 'res/platform1-2x.png'
        @game.load.image 'platform.2', 'res/platform2-2x.png'
        @game.load.image 'platform.3', 'res/platform3-2x.png'

        # Health
        @game.load.image 'lives', 'res/heart-2x.png', 128, 128
        @game.load.image 'healthBar', 'res/healthbar-2x.png'

        # Dialog Box
        @game.load.image 'dialog', 'res/dialogue.png'

        # Main Dude
        @game.load.spritesheet 'dude', 'res/char-blue-2x.png', 48, 48
        @game.load.spritesheet 'hat_npc', 'res/npc6-2x.png', 32, 32

        # Bullets + guns
        @game.load.spritesheet 'bullet', 'res/bullet-2x.png', 32, 32
        @game.load.spritesheet 'enemyBullet', 'res/bullet-2x.png', 32, 32

        @game.load.image 'gun_pistol', 'res/gun2-2x.png'
        @game.load.image 'gun_shotgun', 'res/gun4-2x.png'
        @game.load.image 'gun_smg', 'res/gun1-2x.png'
        @game.load.image 'gun_minigun', 'res/gun3-2x.png'

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
        @game.load.audio 'music', 'res/pigvane_music.wav'
        
        # SFX
        @game.load.audio 'sfx_jump', 'res/Jump.mp3'
        @game.load.audio 'sfx_gunshot_player', 'res/gunshot.wav'
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
