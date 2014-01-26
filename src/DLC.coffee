class Pigvane.Classes.DLC
    
    constructor: (@game) ->
        @choosing = false
        
    popup: () ->

        if !@choosing
            @choosing = true
            dialog = @game.add.group()
            dialog.x = 148
            dialog.y = 80
            
            bg = dialog.create(0, 0, 'dialog')
            bg.fixedToCamera = true
    
            textSprite = @game.add.sprite()
    
            text = @game.add.text(60, 40, 'Would you like to buy the DLC to continue?\n                1. Yes    2. Ok', {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 450 })
            textSprite.addChild(text)
            textSprite.fixedToCamera = true
    
            dialog.add textSprite
    
            waitForIt = () ->
                        
                if Pigvane.Main.game.input.keyboard.isDown 49
                    dialog.destroy()
                    Pigvane.Main.dlc.purchase()
                else if Pigvane.Main.game.input.keyboard.isDown 50
                    dialog.destroy()
                    Pigvane.Main.dlc.purchase()
                # else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.LEFT
                #     @choosing = false
                #     dialog.destroy()
                # else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.RIGHT
                #     @choosing = false
                #     dialog.destroy()
                else
                    setTimeout waitForIt, 100
            
            waitForIt()
    
    purchase: () ->
        Pigvane.Main.dude.x = 8192