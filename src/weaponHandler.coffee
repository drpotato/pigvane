class Pigvane.Classes.weaponHandler
    constructor: (@game) ->

        @game.Main.scoreHandler.onScoreUpdate.add @onScoreUpdate, @

        @weapons = [
            {
                name: 'Pistol',
                damage: 5,
                fireRate: 250,
                velocity: 800,
                threshold: 250
                sprite: 'gun_pistol'
            },
            {   
                name: 'Assault Rifle',
                damage: 3,
                fireRate: 150,
                velocity: 1000,
                threshold: 500,
                sprite: 'gun_smg'
            },
            {   
                name: 'Minigun',
                damage: 5,
                fireRate: 80,
                velocity: 1500,
                threshold: 2000,
                sprite: 'gun_minigun'
            },
            {   
                name: 'Shotgun',
                damage: 30,
                fireRate: 500,
                velocity: 700,
                threshold: 10000000000000000000000000,
                sprite: 'gun_shotgun'
            }
            

        ]
        
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
        return @weapons[@game.weapon]

    upgrade: () ->
        @game.weapon++
        @game.weapon++
        @overlay.setText @getCurrentWeapon().name
        @game.Main.gun.loadTexture(@game.Main.config.prefix + @getCurrentWeapon().sprite)
        @game.Main.dude.addText('New Weapon!', 'white', 20)
        @threshold = @weapons[@game.weapon].threshold

    onScoreUpdate: () ->
        if @game.score >= @threshold
            @upgrade()

        return true