class Pigvane.Classes.HealthOverlay
    constructor: (@game) ->
        #Created a Sprite with fixedToCamera = true
        sprite = @game.add.sprite(0,0);
        sprite.fixedToCamera = true;
        #addChild of my text at x:0, y:0
        @livesTitle = 'Lives : '
        livesLeft = Pigvane.Main.dude.lives
        @livesText = @game.add.text(0,0,@livesTitle + livesLeft);
        sprite.addChild(@livesText);
        @healthTitle = 'Health : ';
        healthLeft = Pigvane.Main.dude.health;
        @healthText = @game.add.text(0,30,@healthTitle + healthLeft);
        sprite.addChild(@healthText);
        #position the cameraOffset of my Sprite
        sprite.cameraOffset.x = 10;
        sprite.cameraOffset.y = 10;
        
    update: () ->
        healthLeft = Pigvane.Main.dude.health
        console.log healthLeft
        @healthText.content = @healthTitle + healthLeft
        livesLeft = Pigvane.Main.dude.lives
        @livesText.content = @livesTitle + livesLeft