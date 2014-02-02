class Pigvane.Classes.aggroHelper
    constructor: (@game) ->

        @overlay = @game.add.sprite 0, 0, 'aggro-vignette'
        @overlay.fixedToCamera = true 
        @overlay.alpha = 0

    update: ->
        @updateOverlay()

    updateOverlay: ->
        # if Pigvane.Main.dude.recentAggro > 25
        #     @overlay.alpha = 1
        # else if Pigvane.Main.dude.recentAggro > 5
        #     @overlay.alpha = 1*(Pigvane.Main.dude.recentAggro-5)/20


