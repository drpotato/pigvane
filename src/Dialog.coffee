class Pigvane.Classes.Dialog
    constructor: (@game, @text = "Hey") ->
        
        @dialogList = {
            'dialog_template': {
                'request': 'Help me!',
                'options': '1. Yes.\n2. No\n3. Kill them.'
            },
            'old_man': {
                'request': '"Oh where are my glasses? I had them this morning..."',
                'options': '1. Tell him they\'re on his head.\n2. Ignore him and walk away.\n3. Put him out of his misery.'
            },
            'ice_cream_kid': {
                'request': '*sob* "My ICE CREEEEAM WAAAAHH!" *sob*',
                'options': '1. "Kid, you don\'t need to scream for ice cream, here\'s a dollar."\n2. Let out a shrill scream and walk away.\n3. Give the kid a 9mm brian freeze.'
            },
            'girl_with_pig': {
                'request': '"My little piggy is just so adorable."',
                'options': '1. Give her a pretty pink bow for her pig.\n2. Stare the pig in the eye and say "I love you." then leave.\n3. Make some bacon.'
            },
            'candy_crusher': {
                'request': '"Crushing candy™ all day long, if only I could do this from my phone, then people would follow my saga™."',
                'options': '1. Shop him to the app store.\n2. Leave before anyone takes legal action.\n3. Crush™ his dreams.'
            },
            'cake_cat': {
                'request': '"Have you seen Fionna anywhere? Oh I hope she took a jacket otherwise she\'ll get frozen solid!"',
                'options': '1. "Maybe she went to see the gumball guy."\n2. "No."\n3. "I\'ll freeze you solid."'
            },'angry_pig': {
                'request': '"Ooohh... * belch* I shouldn\'t have eaten so much candy™."',
                'options': '1. Offer your sympathy and a pat on the back.\n2. Eat some candy™ infront of him.\n3. "I\'ve always wondered what green ham tastes like... Now I just need some green eggs."'
            },
            'fruit_ninja': {
                'request': '"Fruit has no place in candy™ land. Their vitamins and minerals must be sliced to pieces."',
                'options': '1. Join in the fruit massacre.\n2. "Nope."\n3. Kill the ninja and begin a fruit uprising.'
            },
            'red_riding_hood': {
                'request': '"Wow grandma, what big teeth you have!"\n "All the better to eat you with."',
                'options': '1. "That\'s clearly a wolf little girl"\n2. Pull up a chair and watch.\n3. "That cave looks like a nice private eating spot."'
            },
            'squirrell': {
                'request': '"I love me some good nuts! Especially the big, firm ones."',
                'options': '1. "There\'s a juicy pair over there."\n2. Back away slowly.\n3. Feed him his own nuts.'
            },
            'yogi_bear': {
                'request': '"Oooh I\'m starving! It\'s a tough life foraging for food."',
                'options': '1. Point out the unguarded picnic basket in the distance.\n2. Eat a sandwich.\n3. Panic and shoot the bear before he mauls you.'
            },
            'sonic': {
                'request': '"I used to run fast, but without my lucky sneakers I\'ll never run like I used to."',
                'options': '1. "You never needed the sneakers. \'You could run fast all day long\'"\n2. "Gotta go fast!"\n3. "I don\t care for your pumped up kicks, you can\'t outrun my gun!"'
            }
        }
    
    popup: (dialogName, npc) ->

        dialog = @game.add.group()
        dialog.x = 148
        dialog.y = 80
        dialog.alpha = 0
        
        bg = dialog.create(0, 0, 'dialog')
        bg.fixedToCamera = true

        textSprite = @game.add.sprite()

        text = @game.add.text(30, 30, @dialogList[dialogName]['request'], {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 200 })
        textSprite.addChild(text)
        textSprite.fixedToCamera = true

        dialog.add textSprite

        @game.add.tween(dialog).to({y: 100, alpha: 1}, 1000, Phaser.Easing.Linear.None, true)

        callback = () -> 
            tween = Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
            tween.onComplete.add( () ->
                dialog.destroy()
                dialog = Pigvane.Main.game.add.group()
                dialog.x = 148
                dialog.y = 80
                dialog.alpha = 0
                
                bg = dialog.create(0, 0, 'dialog')
                bg.fixedToCamera = true
        
                textSprite = Pigvane.Main.game.add.sprite()
        
                text = Pigvane.Main.game.add.text(30, 30, Pigvane.Main.dialog.dialogList[dialogName]['options'], {'font': '30px Arial', 'fill': 'black', 'wordWrap': true, 'wordWrapWidth': 200 })
                textSprite.addChild(text)
                textSprite.fixedToCamera = true
                
                dialog.add textSprite

                Pigvane.Main.game.add.tween(dialog).to({y: 100, alpha: 1}, 1000, Phaser.Easing.Linear.None, true)
                
                waitForIt = () ->
                    
                    if Pigvane.Main.game.input.keyboard.isDown 49
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '1'
                    else if Pigvane.Main.game.input.keyboard.isDown 50
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '2'
                    else if Pigvane.Main.game.input.keyboard.isDown 51
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse '3'
                    else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.LEFT
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse 'reset'
                    else if Pigvane.Main.game.input.keyboard.isDown Phaser.Keyboard.RIGHT
                        Pigvane.Main.game.add.tween(dialog).to({y: 80, alpha: 0}, 2000, Phaser.Easing.Linear.None, true)
                        npc.sendResponse 'reset'
                    else
                        setTimeout waitForIt, 100
                
                waitForIt()
                )
        
        setTimeout callback, 3000