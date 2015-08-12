## Connect 4 ##

This is a basic ruby implementation of the classic game, Connect 4. To run type

`ruby connect-four.rb`

in the directory with the console.

## Development ##
3 hours were approximately spent on writing project. A lot of time was spent developing an algorithm for checking winning conditions of Connect 4. Most features were targeted, except for the feature for players being able to choose the dimensions and pieces needed to win.

The board  dimensions can be selected, but the win status checking algorithm isn't mature enough to look for an variable adjacent pieces.

## Algorithm ##
The algorithm checks for 4 identical pieces horizontally, vertically, and diagonally. The time complexity is a about O(n*m*4) overall, due to iterating through 16 positions for the four orientations.

A better algorithm could be reached that is less opinionated about the adjacent pieces and cutting down on work already down. The idea is that the board has to iterate through each position on the board, but it should only have to iterate once while checking for multiple orientations at the same time.

## Key Decisions ##
The winning algorithm was developed naively in the hopes of iterating through it and optimizing it. TDD was used to lead the development of the algorithm and helped managed one winning condition at at time. Unfortunately not all edge cases aren't considered, but for the Game is largely playable.

There's an abstract Player class that HumanPlayer and ComputerPlayer both inherit from. Their states and behavior are identicaly, except for how they select a position. This helped focus on the relationships between the Game class and Player classes.

## Thoughts and Opinions ##
I got really into building the win state algorithm, but I wish I dedicated more time to display and presentation. It is serviceable, but I wish to incorporate color and unicode characters. I felt the winning algorithm can be iterated upon once I rounded up my tests.

The algorithm portion was rough, because there's much more to consider - variable dimensions, approaches, implementations, and edge cases.

Nonetheless overall I look forward to building any kind of game. I rather enjoy thinking about games because of the OOP designing involved and managing their implementation and relationships.
