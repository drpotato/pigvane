class Pigvane.Classes.Level3 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play('', 0, 0.5, true)
        
    initConfig: () ->
        @config.prefix =        'lvl5-'
        @config.tilemap =       'lvl5-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl5-bg'
        @config.bgScroll1 =     'lvl5-bgScroll1'
        @config.bgScroll2 =     'lvl5-bgScroll2'
        @config.fgScroll =      'lvl5-fg'
        @config.nextLevelX = 23000
        @config.floor =         'lvl5-floor'
        @config.platformData =  'lvl5'
        