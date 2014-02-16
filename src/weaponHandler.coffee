class Pigvane.Classes.weaponHandler
    constructor: (@game) ->

        Pigvane.Main.scoreHandler.onScoreUpdate.add @onScoreUpdate, @

        @weapons = [
            {
                name: 'Pistol',
                damage: 5,
                fireRate: 250,
                velocity: 800,
                sprite: 'gun_pistol'
            },
            {   
                name: 'Minigun',
                damage: 10,
                fireRate: 120,
                velocity: 1500,
                threshold: 200,
                sprite: 'gun_minigun'
            }
        ]

        @currentWeapon = -1
        
        @overlay = @game.add.text(15, 950, "", {
            font: '80px Emulogic',
            fill: 'white',
            strokeThickness: 0,
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
        Pigvane.Main.gun.loadTexture(@getCurrentWeapon().sprite)
        Pigvane.Main.dude.addText('New Weapon!', 'white', 20)
        if @weapons[@currentWeapon+1]?
            @threshold = @weapons[@currentWeapon+1].threshold
        else 
            @threshold = 10000000000 # Good luck - this is the length of my dick, <3 O

    onScoreUpdate: () ->
        if Pigvane.score >= @threshold
            @upgrade()

        return true