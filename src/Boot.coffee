# First state to run of the Pigvane.States, handles initialisation of display and interaction
class Pigvane.States.Boot 
	# `@game` automatically creates `this.game = game`
    constructor: (@game) ->

    # We currently don't do anything in the Boot state
    preload: () ->
    	@game.load.image 'preload', 'res/barscaled.png'

    create: () ->
    	# Continue on to the `Preloader` state
        @game.state.start 'Preloader'