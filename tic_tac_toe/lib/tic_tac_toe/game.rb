module TicTacToe

  # Represents a new game and includes all methods involving gameplay mechanics
  class Game

    def initialize
      @board = Board.new
      @player1 = Player.new("Player 1", "X")
      @player2 = Player.new("Player 2", "O")
      @quit = false
      @restart = false
      @coordinates = []
      start_game
    end

    # Begins the game with instructions and a call to the play_game method
    def start_game
      puts """
      Hello there! Welcome to Tic Tac Toe!
      - Player 1, your mark is 'X'.
      - Player 2, your mark is 'O'.

      Rules:
      - You will take turns marking the empty cells in the
        game board with your corresponding mark.
      - When prompted, type in the row number and then the column number
        that corresponds to the cell of your choice.
      - The player that places 3 marks in a row on the board wins!

      Options
      - Type 'quit' at any point to quit the game.
      - Type 'restart' at any point to restart the game.
      """

      play_game 
    end

    # Includes a loop that continues to allow players to add marks to
    # the board and exits the loop once the game is over
    def play_game
      current_player = @player1
      until @quit || gameover?
        restart_game if @restart
        @board.print
        @coordinates = take_turn(current_player)
        current_player = switch_player(current_player)
      end
    end

    # If user input is quit or restart, stops the turn and allows for
    # breaking out of the play_game loop
    def quit_or_restart?(input)
      if input.downcase == "quit"
        @quit = true
        true
      elsif input.downcase == "restart"
        @restart = true
        true
      else
        false
      end
    end

    # Restarts the game by creating a fresh board
    def restart_game
      puts
      puts "=" * 70
      puts
      puts "Starting new game..."
      @board = Board.new
      @restart = false
      @coordinates = []
    end

    # Returns true if game is over and false otherwise
    def gameover?
    end

    # Returns an array of coordinates of the cell the player wants to mark
    def take_turn(player)
      puts "#{player.name} ('#{player.mark}'), it's your turn."
      puts
      coordinates = prompt_user(player)
      until @quit || @restart || valid_cell?(coordinates)
        puts "That is not an empty cell! Try another cell."
        puts
        coordinates = prompt_user
      end
      coordinates
    end

    # Prompts user to input a row and column
    def prompt_user(player)
      puts "What row do you want to place your '#{player.mark}'? "\
           "(Choose a row from 1-3)"
      print ">> "
      row = get_input
      return if quit_or_restart?(row)
      puts
      puts "And column? (Choose a column from 1-3)"
      print ">> "
      column = get_input
      [row.to_i - 1, column.to_i - 1]
    end

    # Returns valid input when the user is prompted
    def get_input
      input = gets.chomp
      until valid_input?(input)
        puts "Invalid input. Please type in a number from 1-3, 'quit', or "\
             "'restart'."
        print ">> "
        input = gets.chomp
      end
      input
    end

    # Returns true if the input is valid (quit, restart, or coordinates)
    def valid_input?(input)
      if input.downcase == "quit" || input.downcase == "restart"
        true
      elsif 1 <= input.to_i && input.to_i <= 3
        true
      else
        false
      end
    end

    # Returns true if coordinates correspond to an empty cell
    def valid_cell?(coordinates)
      @board.cells[coordinates[0]][coordinates[1]].state == " "
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