# MontyHallSolver

 Monty Hall Simulator in Haskell

This is a Haskell program that simulates the classic Monty Hall problem to compare the effectiveness of two strategies:

🚪 Always Stay with your initial choice
🔄 Always Switch after the host opens a door
The program runs the simulation many times and reports the win percentages for each strategy.

Requirements

GHC (Glasgow Haskell Compiler) 9.6 or later (for numeric underscore support)
Stack or cabal (optional, for building)

Installation

Using Cabal
git clone https://github.com/crweaver225/MontyHallSolver.git
cd montyhallsolver
cabal build
cabal run

Using GHC directly
ghc -O2 -Wall -o montyhall app/Main.hs
Running the Program

./montyhall
You should see output like:

Running 1_000_000 simulations...
Always STAY strategy win rate: 33.29%
Always SWITCH strategy win rate: 66.71%
Best strategy: SWITCH
📄 How It Works

One of three doors hides a prize.
The player picks a door at random.
The host opens a different door that doesn't have the prize.
The player either:
Stays with their original pick
Switches to the remaining unopened door
The program simulates this process for a large number of trials and reports the win percentages for each strategy.

Why It Matters

The Monty Hall problem is a famous probability puzzle that surprises many people:

Switching gives you a 2/3 chance of winning, while staying gives only 1/3.
This simulator confirms that result empirically.

📝 Notes

The number of simulations can be adjusted in app/Main.hs by changing numTrials.
Numeric underscores (e.g., 1_000_000) are enabled using the NumericUnderscores language extension.
📚 License

MIT License. Use freely for teaching, learning, or experimenting.
