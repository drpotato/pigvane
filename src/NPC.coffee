class Pigvane.Classes.NPC extends Phaser.Sprite
    constructor: (@game, x, y, name, @deathAchievement, @dialog) ->
        
        super @game, x, y, name
        
        Pigvane.Main.npcController.npcDialogBoxes.add(new Pigvane.Classes.NPCDialogBox(@game, x, y, @))
        
        # Set collision size
        @anchor.setTo(0.5,0.5)

        # Stop it walking out of the world
        @body.collideWorldBounds = true
        
        @talking = false
        @willTalk = true

        @facing = 'left'

        @body.gravity.y = 10
        
        @health = 3
        
    update: () ->
        
        @game.physics.collide @, Pigvane.Main.mainLayer
        
    hit: () ->
        
        if @health > 0
            @health -= 1
        
            if @health <= 0
                @die()
    
    die: () ->
        
        if @deathAchievement?
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
                console.log
            when '2'
                console.log
            when '3'
                @die()
            when 'reset'
                @willTalk = true