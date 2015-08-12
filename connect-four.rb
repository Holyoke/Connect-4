require_relative "lib/game.rb"

if $PROGRAM_NAME == __FILE__
  puts "Let's play some Connect 4!"
  puts "Please select from below:"
  puts "1.) CPU vs CPU"
  puts "2.) Human vs CPU"
  puts "3.) Human vs Human"
  puts "Go ahead and enter an option!"

  option = gets.chomp.to_i

  case option
  when 1
    Game.new.play
  when 2
    player = HumanPlayer.new(:w)
    game = Game.new(player)
    game.play
  when 3
    player1 = HumanPlayer.new(:w)
    player2 = HumanPlayer.new(:b)
    game = Game.new(player1, player2)
    game.play
  else
    puts "Not a valid option! Quitting program."
  end
end
