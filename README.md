# Tic Tac Toe... Again!

This is my latest take on Tic-Tac-Toe. It is a pure Ruby app--no Rails--and runs in a console interface.

To play a game, run `rake play`. You will first be prompted to choose a board size--choose number of rows or columns you want to play with (ex: an input of 3 generates a 3x3 board). Next, you'll set up the players (see below). Each player can use a custom token--you aren't limited to X's and O's here!

Players can be human or computer. A human player selects a spot on the board by choosing its index number. The board spots start at zero (0) and increment left to right, top to bottom. For example, the spots on a 3x3 board look like this:

0 | 1 | 2

3 | 4 | 5

6 | 7 | 8


Two difficulty levels are availale for computer players: easy and hard. The former uses the SimpleAI module, while the latter uses the UnbeatableAI module (which uses the MiniMax algorithm).

## More info
Use `rake console` to open up a Pry console for exploring, debugging, etc. It will set up a board, two players, and a GameRunner object for your convenience.
