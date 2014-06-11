class Pigvane.Classes.weaponHandler
    constructor: (@game) ->

        Pigvane.Main.scoreHandler.onScoreUpdate.add @onScoreUpdate, @

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
                fireRate: 100,
                velocity: 1500,
                threshold: 2000,
                sprite: 'gun_minigun'
            },
            {
                name: 'Shotgun',
                damage: 15,
                fireRate: 250,
                velocity: 2000   ,
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
        @loadWeapon()

        @drawn = false

    toggleOverlay: ->
        @drawn = !@drawn
        @overlay.visible = @drawn

    getCurrentWeapon: () ->
        return @weapons[Pigvane.weapon]

    loadWeapon: () ->
        @overlay.setText @getCurrentWeapon().name
        Pigvane.Main.gun.loadTexture(Pigvane.Main.config.prefix + @getCurrentWeapon().sprite)
        Pigvane.Main.dude.addText('New Weapon!', 'white', 20)
        @threshold = @getCurrentWeapon().threshold

    upgrade: () ->
        Pigvane.weapon++
        @loadWeapon()

    onScoreUpdate: () ->
        if Pigvane.score >= @threshold
            @upgrade()

        return true