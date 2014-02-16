class Pigvane.Classes.Level1 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play()
        
    initConfig: () ->
        @config.prefix =        'lvl1-'
        @config.tilemap =       'lvl1-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl1-bg'
        @config.bgScroll1 =     'lvl1-bgScroll1'
        @config.bgScroll2 =     'lvl1-bgScroll2'
        @config.fgScroll =      'lvl1-fg'
        @config.nextLevelX = 2000
        @config.floor =         'lvl1-floor'
        @config.platformData =  'lvl1'        