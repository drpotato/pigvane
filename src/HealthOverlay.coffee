class Pigvane.Classes.HealthOverlay
    constructor: (@game) ->
        #Created a Sprite with fixedToCamera = true
        sprite = @game.add.sprite(0,0);
        sprite.fixedToCamera = true;
        #addChild of my text at x:0, y:0
        livesString = 'Lives : '
        livesLeft = Pigvane.Main.dude.lives
        livesText = @game.add.text(0,0,livesString + livesLeft);
        sprite.addChild(livesText);
        healthString = 'Health : ';
        healthLeft = Pigvane.Main.dude.health;
        healthText = @game.add.text(0,30,healthString + healthLeft);
        sprite.addChild(healthText);
        #position the cameraOffset of my Sprite
        sprite.cameraOffset.x = 10;
        sprite.cameraOffset.y = 10;
        
    update: () ->
        healthLeft = Pigvane.Main.dude.health
        @healthText.content = healthLeft
        livesLeft = Pigvane.Main.dude.lives
        @livesTest.content = livesLeft