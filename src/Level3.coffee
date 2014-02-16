class Pigvane.Classes.Level3 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play('', 0, 1, true)
        
    initConfig: () ->
        @config.prefix =        'lvl3-'
        @config.tilemap =       'lvl3-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl3-bg'
        @config.bgScroll1 =     'lvl3-bgScroll1'
        @config.bgScroll2 =     'lvl3-bgScroll2'
        @config.fgScroll =      'lvl3-fg'
        @config.nextLeveLX = 8200
        @config.floor =         'lvl3-floor'
        @config.platformData =  'lvl3'
        