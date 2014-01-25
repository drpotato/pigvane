class Pigvane.Classes.NPCController
    constructor: (@game) ->
        
        @npcs = @game.add.group()
        
        # Create NPCs here...
        @npcs.add new Pigvane.Classes.NPC(@game, @game.height - 50, 50, 'hat_npc', 'kill_1')
        
    update: () ->
        
        @game.physics.collide Pigvane.Main.bullets, @npcs, @collisionHandler
    
    collisionHandler: (obj1, obj2) ->
        
        obj2.hit()
        
        obj1.kill()