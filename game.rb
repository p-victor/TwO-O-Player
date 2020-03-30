require_relative './player'

class Game

  def initialize
  
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @players = [@player1, @player2]
    @round = 1
  
  end

  def ask_question(player)
    number1 = rand(1...21)
    number2 = rand(1...21)
    puts "Player #{player.id}: What does #{number1} plus #{number2} equal?"
    number1 + number2
  end

  def display_current_score
    current_score = @players.sort{|a, b| a.id <=> b.id}.collect{|player| "P#{player.id}: #{player.get_score}"} 
    puts current_score.join(' vs ')
  end

  def display_winner
    winner = alive_players.first
    puts "Player #{winner.id} wins with a score of #{winner.get_score} !" 
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def game_over?
    alive_players.count == 1
  end

  def get_current_player
    alive_players.first
  end

  def alive_players
    @players.select{|player| !player.dead?}
  end

  def next_round
    puts "----- NEW TURN -----"
    @round += 1
    @players.rotate!
  end

  def play

    until(game_over?) do
      current_player = get_current_player
      answer = ask_question(current_player)
      if answer == gets.chomp.to_i
        puts answer
        puts "Player #{current_player.id}: YES! You are correct."
      else
        puts answer
        current_player.hp -= 1
        puts "Player #{current_player.id}: Seriously? No!"
      end

      display_current_score
      next_round
    end

    display_winner

  end

end