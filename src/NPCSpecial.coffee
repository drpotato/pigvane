class Pigvane.Classes.NPCSpecial extends Pigvane.Classes.NPC
    constructor: (@game, x, y, name, @numberFrames, @deathAchievement, @helpAchievement, @dialog) ->
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
            @destroy()
    
    talk: () ->
        if @dialog? and !@talking and @willTalk
            @talking = true
            response = Pigvane.Main.dialog.popup @dialog, @
    
    addAnimations: () ->
        @animations.add 'walk', [0...@numberFrames]
        @animations.play 'walk', 2, true
            
    sendResponse: (option) ->
        @talking = false
        @willTalk = false
        switch option
            when '1'
                if @helpAchievement?
                    Pigvane.Main.achievements.grant @helpAchievement
                Pigvane.Main.dude.helps += 1
            when '2'
                Pigvane.Main.dude.ignores += 1
            when '3'
                @die()
            when 'reset'
                @willTalk = true