class Pigvane.Classes.Dialog
    constructor: (@game, @text = "Hey") ->
        
        @dialogList = {
            'dialog_template': {
                'request': 'Help me!',
                'options': '1. Yes.\n2. No\n3. Kill them.'
            }
        }
    
    popup: (dialogName, npc) ->

        dialog = @game.add.group()
        dialog.x = 148
        dialog.y = 80
        dialog.alpha = 0
        
        bg = dialog.create(0, 0, 'dialog')
        bg.fixedToCamera = true

        textSprite = @game.add.sprite()

        text = @game.add.text(30, 30, @dialogList[dialogName]['request'], {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 200 })
        textSprite.addChild(text)
        textSprite.fixedToCamera = true

        dialog.add textSprite

        @game.add.tween(dialog).to({y: 100, alpha: 1}, 1000, Phaser.Easing.Linear.None, true)

        callback = () -> 
            tween = Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                dialog.destroy()
                dialog = Pigvane.Main.game.add.group()
                dialog.x = 148
                dialog.y = 80
                dialog.alpha = 0
                
                bg = dialog.create(0, 0, 'dialog')
                bg.fixedToCamera = true
        
                textSprite = Pigvane.Main.game.add.sprite()
        
                text = Pigvane.Main.game.add.text(30, 30, Pigvane.Main.dialog.dialogList[dialogName]['options'], {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 200 })
                textSprite.addChild(text)
                textSprite.fixedToCamera = true
                
                dialog.add textSprite

                Pigvane.Main.game.add.tween(dialog).to({y: 100, alpha: 1}, 1000, Phaser.Easing.Linear.None, true)
                
                waitForIt = () ->
                    
                    if Pigvane.Main.game.input.keyboard.isDown 49
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '1'
                    else if Pigvane.Main.game.input.keyboard.isDown 50
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '2'
                    else if Pigvane.Main.game.input.keyboard.isDown 51
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '3'
                    else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.LEFT
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse 'reset'
                    else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.RIGHT
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse 'reset'
                    else
                        setTimeout waitForIt, 100
                
                waitForIt()
                )
        
        setTimeout callback, 3000