# Tic Tac Toe... Again!

This is my latest take on Tic-Tac-Toe. It is a pure Ruby app--no Rails--and runs in a console interface.

To play a game, run `rake play`. You will first be prompted to choose a board size--choose number of rows or columns you want to play with (ex: an input of 3 generates a 3x3 board). Next, you'll set up the players (see below). Each player can use a custom token--you aren't limited to X's and O's here!

## Players

### Human
You! (Or maybe your pair partner.) When it's your turn to play, select a spot on the board by choosing its index number. The board spots start at zero (0) and increment left to right, top to bottom. For example, a 3x3 board looks like this:

0 | 1 | 2

3 | 4 | 5

6 | 7 | 8

### Jane
The lovely, charming artificial sentience living in the ansible network. When not chatting with Ender, she enjoys playing Tic Tac Toe with people. Jane has always been friendly with humans...

### Joshua
The WOPR from "WarGames" is relentless in his pursuit of victory. **COMING SOON**


## More info
Use `rake console` to open up a Pry console for exploring, debugging, etc. It will set up a game with some players for your convenience.
