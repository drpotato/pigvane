class Pigvane.Classes.HealthOverlay
    constructor: (@game) ->
        #Created a Sprite with fixedToCamera = true
        sprite = @game.add.sprite(0,0);
        sprite.fixedToCamera = true;

        livesLeft = Pigvane.Main.dude.lives
        
        @hearts = @game.add.group()
        @hearts.x = 15
        @hearts.y = 5

        @heartsArray = []

        for i in [0...livesLeft]
            heartContainer = @game.add.sprite(0,0)
            heart = @game.add.sprite(40*i, 0, 'lives')

            heart.animations.add('main', [0,1,2,3])
            heart.animations.play('main', 4, true)

            heartContainer.addChild heart
            heartContainer.fixedToCamera = true
            
            @hearts.add heartContainer
            @heartsArray.push heartContainer

        # sprite.addChild(@livesText);

        sprite.cameraOffset.x = 10;
        sprite.cameraOffset.y = 10;

        @healthBar = @game.add.sprite 15, 40, 'healthBar'
        @healthBar.cropEnabled = true
        @healthBar.crop = new Phaser.Rectangle 0, 0, 128, 32
        @healthBar.fixedToCamera = true
        
    update: () ->
        @healthBar.crop.width = (Pigvane.Main.dude.health/Pigvane.Main.dude.maxHealth) * 128

    removeLife: () ->
        toDestroy = @heartsArray.pop()
        toDestroy.destroy()
