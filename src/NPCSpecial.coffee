class Pigvane.Classes.NPCSpecial extends Pigvane.Classes.NPC
    constructor: (@game, x, y, name, @deathAchievement, @dialog) ->
        super @game, x, y, name

        Pigvane.Main.npcController.npcDialogBoxes.add(new Pigvane.Classes.NPCDialogBox(@game, x, y, @))

        @talking = false
        @willTalk = true

    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer

    
    die: () ->
        
        Pigvane.Main.dude.specialKills += 1
        
        if @deathAchievement?
            # @animations.frame = ?
            Pigvane.Main.achievements.grant @deathAchievement
    
    talk: () ->
        if @dialog? and !@talking and @willTalk
            @talking = true
            response = Pigvane.Main.dialog.popup @dialog, @
            
    sendResponse: (option) ->
        @talking = false
        @willTalk = false
        switch option
            when '1'
                Pigvane.Main.dude.helps += 1
            when '2'
                Pigvane.Main.dude.ignores += 1
            when '3'
                @die()
            when 'reset'
                @willTalk = true