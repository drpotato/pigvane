class Pigvane.Classes.Level3 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play()
        
    initConfig: () ->
        @config.prefix =        'lvl4-'
        @config.tilemap =       'lvl4-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl4-bg'
        @config.bgScroll1 =     'lvl4-bgScroll1'
        @config.bgScroll2 =     'lvl4-bgScroll2'
        @config.fgScroll =      'lvl4-fg'
        @config.nextLevelX = 4000
        @config.floor =         'lvl4-floor'
        @config.platformData =  'lvl4'
        