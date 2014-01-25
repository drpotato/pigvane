class Pigvane.Classes.Dialog
    constructor: (@game, @text = "Hey") ->

        @dialog = @game.add.group()
        @dialog.x = 148
        @dialog.y = 80
        @dialog.alpha = 0
        
        bg = @dialog.create(0, 0, 'dialog')
        bg.fixedToCamera = true

        textSprite = @game.add.sprite()
        textSprite.fixedToCamera = true

        text = @game.add.text(30, 30, @text, {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 200 })
        textSprite.addChild(text)

        @dialog.add text

        @game.add.tween(@dialog).to({y: 100, alpha: 1}, 1000, Phaser.Easing.Linear.None, true)

        dialog = @dialog

        callback = () -> 
            tween = Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                dialog.destroy()
                )
        
        setTimeout callback, 3000