class Pigvane.States.Preloader
    # `@game` automatically creates this.game
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->
        # Set up preloadBar using built-in methods
        @preloadBar = @add.sprite 356, 370, 'preloaderBar'
        @load.setPreloadSprite @preloadBar

        # Load game resources
        @game.load.tilemap 'test', 'res/test.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.tileset 'blocks', 'res/tiles-large.png', 32, 32
        @game.load.image 'achievement_background', 'res/achievement.png'
        @game.load.spritesheet 'dude', 'res/testwalking-large.png', 32, 32
        @game.load.spritesheet 'hat_npc', 'res/npc6-large.png', 32, 32
        @game.load.image 'background', 'res/basebackground.png'
        @game.load.image 'scanlines', 'res/scanlines.png'
        @game.load.image 'vignette', 'res/vignette.png'
        @game.load.spritesheet 'bullet', 'res/bullet-large.png', 32, 32
        @game.load.audio 'ambient_city_music', 'res/ambient_city_music.mp3'
        
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
        @game.state.start 'Main'
