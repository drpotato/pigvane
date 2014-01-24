Pigvane = {
	States: {},
	Classes: {}
}

Pigvane.game = new Phaser.Game(800, 600, Phaser.AUTO, 'game')

Pigvane.game.state.add('Boot', Pigvane.States.Boot, true);
Pigvane.game.state.add('Preloader', Pigvane.States.Preloader, false);
Pigvane.game.state.add('MainMenu', Pigvane.States.MainMenu, false);
Pigvane.game.state.add('Main', Pigvane.States.Main, false);
Pigvane.game.state.add('Restart', Pigvane.States.Restart, false);