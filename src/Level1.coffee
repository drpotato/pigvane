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
<<<<<<< HEAD
        @config.nextLevelX = 4000
=======
        @config.nextLevelX = 22000
>>>>>>> 433f780ef1d9fa3397cadd91a4ac159455f0cb5c
        @config.floor =         'lvl1-floor'
        @config.platformData =  'lvl1'        