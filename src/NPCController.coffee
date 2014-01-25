class Pigvane.Classes.NPCController
    constructor: (@game) ->
        
        @npcs = @game.add.group()
        @npcDialogBoxes = @game.add.group()
        
    update: () ->
        
        @game.physics.overlap Pigvane.Main.bullets, @npcs, @collisionHandler
        @game.physics.overlap Pigvane.Main.dude, @npcDialogBoxes, @dialogHandler
        
    
    collisionHandler: (obj1, obj2) ->
        
        obj2.hit()
        
        if obj2.health > 0
            obj1.kill()
    
    dialogHandler: (obj1, obj2) ->
        
        obj2.initateDialog()