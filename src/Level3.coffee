class Pigvane.Classes.Level3 extends Pigvane.Classes.Level

    constructor: (@game) ->
        super(@game)

    subPreload: () ->
        
    doSound: () ->
        
        @soundManager.music.play()
        
    initConfig: () ->
        @config.prefix =        'lvl3-'
        @config.tilemap =       'lvl3-tm'
        @config.tileset =       'tiles'
        @config.background =    'lvl3-bg'
        @config.bgScroll1 =     'lvl3-bgScroll1'
        @config.bgScroll2 =     'lvl3-bgScroll2'
        @config.fgScroll =      'lvl3-fg'
<<<<<<< HEAD
        @config.nextLevelX = 4000
=======
        @config.nextLevelX = 8200
>>>>>>> 433f780ef1d9fa3397cadd91a4ac159455f0cb5c
        @config.floor =         'lvl3-floor'
        @config.platformData =  'lvl3'
        