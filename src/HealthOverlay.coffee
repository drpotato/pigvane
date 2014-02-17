class Pigvane.Classes.HealthOverlay
    constructor: (@game) ->
        #Created a Sprite with fixedToCamera = true
        sprite = @game.add.sprite(0,0);
        sprite.fixedToCamera = true;

        livesLeft = @game.Main.dude.lives
        
        @hearts = @game.add.group()
        @hearts.x = -5
        @hearts.y = 80

        @heartsArray = []

        for i in [0...livesLeft]
            heartContainer = @game.add.sprite(0,0)
            heart = @game.add.sprite(65*i, 0, 'lives')

            heartContainer.addChild heart
            heartContainer.fixedToCamera = true
            
            @hearts.add heartContainer
            @heartsArray.push heartContainer

        # sprite.addChild(@livesText);

        sprite.cameraOffset.x = 10;
        sprite.cameraOffset.y = 10;

        @healthBar = @game.add.sprite 25, 0, 'healthBar'
        @healthBar.cropEnabled = true
        @healthBar.crop = new Phaser.Rectangle 0, 0, 512, 128
        @healthBar.fixedToCamera = true
        
    update: () ->
        @healthBar.crop.width = (@game.Main.dude.health/@game.Main.dude.maxHealth) * 512

    removeLife: () ->
        toDestroy = @heartsArray.pop()
        toDestroy.destroy()
