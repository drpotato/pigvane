class Pigvane.Classes.LevelCity extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        Pigvane.Main.dlc = new Pigvane.Classes.DLC(@game)
        
    doSound: () ->
        
        @soundManager.music = @game.add.audio 'city_music', 0.5, true
        # @soundManager.music.play()
        
    initConfig: () ->
        @config.background = 'city-bg'
        @config.tilemap = 'city-tm'
        @config.tileset = 'citytiles'
        @config.bgScroll1 = 'city-bgScroll1'
        @config.bgScroll2 = 'city-bgScroll2'
        @config.fgScroll = 'city-fg'
        @config.nextLeveLX = 8200
        @config.vignette = "city-vignette"
        