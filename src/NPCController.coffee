class Pigvane.Classes.NPCController
    constructor: (@game) ->
        
        @npcs = @game.add.group()
        @npcDialogBoxes = @game.add.group()

        Pigvane.Main.onUpdate.add @update, @
        
    update: () ->
        
        @game.physics.overlap Pigvane.Main.bullets, @npcs, @collisionHandler
        @game.physics.overlap Pigvane.Main.dude, @npcDialogBoxes, @dialogHandler
        
        return true
    
    collisionHandler: (obj1, obj2) ->
        
        if obj2.hit() is 'kill'
            obj1.body.velocity.x = 0
            obj1.body.velocity.y = 0
            obj1.x = obj2.x
            obj1.y = obj2.y
            obj1.animations.stop()
            obj1.animations.frame = 3
            setTimeout(( -> obj1.kill()), 200)
        else if obj2.health > 0
            obj1.kill()
    
    dialogHandler: (obj1, obj2) ->
        
        obj2.initateDialog()