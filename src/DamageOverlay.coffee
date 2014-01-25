class Pigvane.Classes.DamageOverlay
    constructor: (@game) ->
        #Life display
        livesString = 'Lives : ';
        livesLeft = 3;
        livesText = @game.add.text(@game.width-150,50, livesString + livesLeft, { fontSize: '34px', fill: '#fff' });
        livesText.fixedToCamera = true
        damageString = 'Damage : ';
        damageLeft = Pigvane.Main.dude.health;
        damageText = @game.add.text(@game.world.width-150,50, damageString + damageLeft, { fontSize: '34px', fill: '#fff' });
        damageText.fixedToCamera = true
        
    update: () ->
        damageLeft = @dude.health;
        damageText = @game.add.text(@game.world.width-150,50, damageString + damageLeft, { fontSize: '34px', fill: '#fff' });
        

    