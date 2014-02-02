class Pigvane.Classes.HealthOverlay
    constructor: (@game) ->
        #Created a Sprite with fixedToCamera = true
        sprite = @game.add.sprite(0,0);
        sprite.fixedToCamera = true;
        #addChild of my text at x:0, y:0
        @livesTitle = 'Lives :'
        livesLeft = Pigvane.Main.dude.lives
        
        @livesText = @game.add.text(0, 0, @livesTitle, {font: '28px Emulogic'});

        @hearts = @game.add.group()
        # @hearts.fixedToCamera = true
        @hearts.x = 120
        @hearts.y = 10

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

        sprite.addChild(@livesText);
        @healthTitle = 'Health : ';
        healthLeft = Pigvane.Main.dude.health;
        @healthText = @game.add.text(0,30,@healthTitle + healthLeft, {font: '28px Emulogic'});
        sprite.addChild(@healthText);
        #position the cameraOffset of my Sprite
        sprite.cameraOffset.x = 10;
        sprite.cameraOffset.y = 10;
        
    update: () ->
        healthLeft = Pigvane.Main.dude.health
        @healthText.setText( @healthTitle + healthLeft )
        # livesLeft = Pigvane.Main.dude.lives
        # @livesText.content = @livesTitle + livesLeft

    removeLife: () ->
        toDestroy = @heartsArray.pop()
        toDestroy.destroy()
        # @hearts.getAt(@hearts.length-1).destroy()