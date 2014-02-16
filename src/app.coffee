
# Set up game width and height
width = 1280
height = 1024

# The global Pigvane variable is set in index.html to avoide out-of-order assignment issues.  
# Creates the game instance, notice ommitance of states `preload`, `create`, and `update`
Pigvane.game = new Phaser.Game width, height, Phaser.WEBGL, 'game'

Pigvane.score = 0

Pigvane.currentLevel = 1

Pigvane.platformData = {}
Pigvane.highscores = []

$.ajax
    url: 'res/level1-platform-data.json'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.platformData.lvl1 = data.platforms

$.ajax
    url: 'res/level2-platform-data.json'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.platformData.lvl2 = data.platforms

$.ajax
    url: 'res/level3-platform-data.json'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.platformData.lvl3 = data.platforms
        console.log data.platforms
    error: (error) ->
        console.log error

$.ajax
    url: 'res/level4-platform-data.json'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.platformData.lvl4 = data.platforms
        console.log data.platforms
    error: (error) ->
        console.log error

$.ajax
    url: 'res/level5-platform-data.json'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.platformData.lvl5 = data.platforms
        console.log data.platforms
    error: (error) ->
        console.log error

$.ajax
    url: 'retrieve_scores'
    async: false
    datatype: 'json'
    success: (data) -> 
        Pigvane.highscores = JSON.parse(data)


    error: (error) ->
        console.log 'Fucked up', error
    


# Add the states from the Pigvane.States object
# The last boolean value determines which will run on startup
Pigvane.game.state.add 'Boot',          Pigvane.States.Boot,        true
Pigvane.game.state.add 'Preloader',     Pigvane.States.Preloader,   false
Pigvane.game.state.add 'MainMenu',      Pigvane.States.MainMenu,    false
Pigvane.game.state.add 'Restart',       Pigvane.States.Restart,     false
Pigvane.game.state.add 'Help',          Pigvane.States.Help,        false
Pigvane.game.state.add 'HighScore',     Pigvane.States.HighScore,   false

Pigvane.game.state.add 'Level1', Pigvane.Classes.Level1, false
Pigvane.game.state.add 'Level2', Pigvane.Classes.Level2, false
Pigvane.game.state.add 'Level3', Pigvane.Classes.Level3, false

String.prototype.replaceAt = (index, character) ->
    return this.substr(0, index) + character + this.substr(index+character.length)