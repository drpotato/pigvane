
# Set up game width and height
width = 800
height = 800

# The global Pigvane variable is set in index.html to avoide out-of-order assignment issues.  
# Creates the game instance, notice ommitance of states `preload`, `create`, and `update`
Pigvane.game = new Phaser.Game width, height, Phaser.AUTO, 'game'

# Add the states from the Pigvane.States object
# The last boolean value determines which will run on startup
Pigvane.game.state.add 'Boot', Pigvane.States.Boot, true
Pigvane.game.state.add 'Preloader', Pigvane.States.Preloader, false
Pigvane.game.state.add 'MainMenu', Pigvane.States.MainMenu, false
Pigvane.game.state.add 'Main', Pigvane.States.Main, false
Pigvane.game.state.add 'Restart', Pigvane.States.Restart, false