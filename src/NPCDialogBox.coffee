class Pigvane.Classes.NPCDialogBox extends Phaser.Sprite
    
    constructor: (@game, x, y, @npc) ->
        
        super @game, x, y
        
        @width = @npc.width * 2
        @height = @npc.height
        
        # Set collision size
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true

        @body.gravity.y = 10
        
    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer
        
    initateDialog: () ->
        if @game.input.keyboard.isDown Phaser.Keyboard.C
            @npc.talk()
    