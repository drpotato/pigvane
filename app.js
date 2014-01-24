Pigvane = {}

Pigvane.game = new Phaser.Game(800, 600, Phaser.AUTO, 'game')

Polis.game.state.add('Boot', Polis.States.Boot, true);
Polis.game.state.add('Preloader', Polis.States.Preloader, false);
Polis.game.state.add('MainMenu', Polis.States.MainMenu, false);
Polis.game.state.add('Main', Polis.States.Main, false);
Polis.game.state.add('Restart', Polis.States.Restart, false);