module TicTacToe

  # Represents a new game and includes all methods involving gameplay mechanics
  class Game
      attr_accessor :board

    def initialize
      @board = Board.new
      @player1 = Player.new("Player 1", "X")
      @player2 = Player.new("Player 2", "O")
      start_game
    end

    # Begins the game with a prompt and a call the play_game method
    def start_game
      puts """
      Hello there! Welcome to Tic Tac Toe!
      - Player 1, your mark is 'X'.
      - Player 2, your mark is 'O'.

      Rules:
      - You will take turns marking the empty spaces in the
        game board with your corresponding mark.
      - When prompted, type in the row number and then column
        number of the cell that you want to place your mark in.
      - The player that places 3 marks in a row on the board wins!

      Options
      - Type 'quit' at any point to quit the game.
      - Type 'restart' at any point to restart the game.
      """
      play_game
    end

    # Includes a loop that continues to allow players to add marks to
    # the board and exits teh loop once the game is over
    def play_game
      current_player = @player1
      until false
        board.print
        coordinates = take_turn(current_player)
        current_player = switch_player(current_player)
      end
    end

    # Returns an array of the coordinates of the cell the player wants to mark
    def take_turn(player)
      puts "#{player.name}, it's your turn."
      puts
      puts "Which row would you like to place your '#{player.mark}'? "\
           "(Choose from 1-3)"
      print ">> "
      row = gets.chomp.to_i - 1 # Must account for fact that actual rows start at 0
      puts
      puts "And column? (Choose from 1-3)"
      print ">> "
      col = gets.chomp.to_i - 1 # Must account for fact that actual cols start at 0
      [row, col]
    end

    # Switches the player from player1 to player2 and vice versa 
    def switch_player(player)
      if player == @player1
        player = @player2
      else 
        player = @player1
      end
    end

  end

end