# Create a 2-Player math game where players take turns to answer simple math addition problems.
# A new math question is generated for each turn by picking two numbers between 1 and 20. The
# player whose turn it is is prompted the question and must answer correctly or lose a life.

# class -> game, player

#State: Storing data describing themselves (variables)
#Behavior: Defining actions that can be performed on them (methods)

require_relative './game'

game1 = Game.new

game1.play