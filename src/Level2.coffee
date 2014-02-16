class Pigvane.Classes.Level2 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play('', 0, 1, true)
        
    initConfig: () ->
        @config.prefix =        'lvl2-'
        @config.tilemap =       'lvl2-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl2-bg'
        @config.bgScroll1 =     'lvl2-bgScroll1'
        @config.bgScroll2 =     'lvl2-bgScroll2'
        @config.fgScroll =      'lvl2-fg'
<<<<<<< HEAD
        @config.nextLevelX = 4000
=======
        @config.nextLevelX = 8200
>>>>>>> 433f780ef1d9fa3397cadd91a4ac159455f0cb5c
        @config.floor =         'lvl2-floor'
        @config.platformData =  'lvl2'
        