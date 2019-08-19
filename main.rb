# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './game'
require './player'
require './question'

## Your test code can go here

# binding.pry

puts "Player 1, what is your name? "
player1 = Player.new(gets.chomp, 3)
puts "Player 2, what is your name? "
player2 = Player.new(gets.chomp, 3)

game = Game.new(player1,player2)
active_player = player1

loop do
  

  question = Question.new
  question.ask_question(active_player.name)
  answer = gets.chomp

  if question.right_answer?(answer) 
    puts "#{active_player.name}: Yes! You are Correct."
  else
    puts "#{active_player.name}, seriously?! No! The right answer was #{question.answer}"
    active_player.decrease_lives
    if active_player.lives == 0
      active_player = (active_player == player1 ? player2 : player1)
      break
    end
  end
  game.display_score(player1, player2)

  active_player = (active_player == player1 ? player2 : player1)
  puts "----- NEW TURN -----"
end
puts "#{active_player.name} wins with a score of #{active_player.lives}/3"
puts "----- GAME OVER -----"
