window.Pigvane = {
	States: {},
	Classes: {}
}

Pigvane.game = new Phaser.Game(800, 600, Phaser.AUTO, 'game')

Pigvane.game.state.add('Boot', Polis.States.Boot, true);
Pigvane.game.state.add('Preloader', Polis.States.Preloader, false);
Pigvane.game.state.add('MainMenu', Polis.States.MainMenu, false);
Pigvane.game.state.add('Main', Polis.States.Main, false);
Pigvane.game.state.add('Restart', Polis.States.Restart, false);