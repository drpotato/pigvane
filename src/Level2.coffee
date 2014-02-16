class Pigvane.Classes.Level2 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play()
        
    initConfig: () ->
        @config.prefix =        'lvl2-'
        @config.tilemap =       'lvl2-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl2-bg'
        @config.bgScroll1 =     'lvl2-bgScroll1'
        @config.bgScroll2 =     'lvl2-bgScroll2'
        @config.fgScroll =      'lvl2-fg'
        @config.nextLevelX = 2000
        @config.floor =         'lvl2-floor'
        @config.platformData =  'lvl2'
        