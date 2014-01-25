class Pigvane.Classes.NPCController
    constructor: (@game) ->
        
        @npcs = @game.add.group()
        
        # Create NPCs here...
        @npcs.add new Pigvane.Classes.NPC(@game, @game.height - 50, 50, 'hat_npc')
        
    update: () ->
        