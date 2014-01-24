class Pigvane.States.Preloader
    # `@game` automatically creates this.game
    constructor: (@game) ->

    # Built-in function of states, called before `create()`
    preload: () ->
        # Set up preloadBar using built-in methods
        @preloadBar = @add.sprite 356, 370, 'preloaderBar'
        @load.setPreloadSprite @preloadBar

        # Load game resources
        @game.load.spritesheet 'dude', 'res/char-large.png', 32, 32
        @game.load.tilemap 'test', 'res/test.json', null, Phaser.Tilemap.TILED_JSON
        @game.load.tileset 'blocks', 'res/blocks-large.png', 32, 32

        # Load title screen resources
        @game.load.image 'titlepage', 'res/rickroll.jpg'
        @game.load.image 'logo', 'res/ea.jpg'

    create: () ->
        # Animate the preloadBar
        tween = @add.tween(@preloadBar).to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, true);
        # When it completes, go to `startMainMenu`
        tween.onComplete.add(@startMainMenu, this);
        
    startMainMenu: () ->
        # Continue to the `MainMenu` state since all resources have been loaded
        @game.state.start 'MainMenu'