class Pigvane.Classes.weaponHandler
    constructor: (@game) ->

        Pigvane.Main.scoreHandler.onScoreUpdate.add @onScoreUpdate, @

        @weapons = [
            {
                name: 'Pistol',
                damage: 5,
                fireRate: 500,
                velocity: 800
            },
            {   
                name: 'Minigun',
                damage: 10,
                fireRate: 80,
                velocity: 1500,
                threshold: 200
            }
        ]

        @currentWeapon = -1
        
        @overlay = @game.add.text(5, 1050, "", {
            font: '20px Emulogic',
            fill: 'white',
            strokeThickness: 5,
            stroke: '3C033A'
            })
        @overlay.fixedToCamera = true
        @overlay.visible = false
        @upgrade()

        @drawn = false
    
    toggleOverlay: ->
        @drawn = !@drawn
        @overlay.visible = @drawn    

    getCurrentWeapon: () ->
        return @weapons[@currentWeapon]

    upgrade: () ->
        @currentWeapon++
        @overlay.setText @getCurrentWeapon().name
        Pigvane.Main.dude.addText('New Weapon!', 'white', 20)
        if @weapons[@currentWeapon+1]?
            @threshold = @weapons[@currentWeapon+1].threshold
        else 
            @threshold = 10000000000 # Good luck

    onScoreUpdate: () ->
        if Pigvane.score >= @threshold
            @upgrade()

        return true