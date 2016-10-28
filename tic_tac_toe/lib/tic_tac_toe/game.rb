module TicTacToe

  # Represents a new game and includes all methods involving gameplay mechanics
  class Game

    def initialize
      @board = Board.new
      @player1 = Player.new("Player 1", "X")
      @player2 = Player.new("Player 2", "O")
      @current_player = @player1
      @cell_coordinates = {"1" => [0,0], "2" => [0,1], "3" => [0,2],
                           "4" => [1,0], "5" => [1,1], "6" => [1,2],
                           "7" => [2,0], "8" => [2,1], "9" => [2,2]}
      @quit = false
      @restart = false
      start_game
    end

    # Begins the game with instructions and a call to the play_game method
    def start_game
      instructions_board = Board.new

      puts """
      Hello there! Welcome to Tic Tac Toe!
      - Player 1, your mark is 'X'.
      - Player 2, your mark is 'O'.

      Rules:
      - You will take turns marking the empty cells in the
        game board with your corresponding mark.
      - When prompted, type in the cell number that you want to
        place your mark in. The board below the instructions
        shows a sample board with the cell numbers.
      - The player that places 3 marks in a row on the board wins!

      Options
      - Type 'quit' at any point to quit the game.
      - Type 'restart' at any point to restart the game.
      """
      puts
      instructions_board.print_instructions_board
      puts

      play_game 
    end

    # Includes a loop that continues to allow players to add marks to
    # the board and exits the loop once the game is over
    def play_game
      until @quit || gameover?
        restart_game if @restart
        @board.print_board
        cell = take_turn(@current_player)
        if !cell.nil?
          coordinates = get_coordinates(cell)
          change_board(coordinates) if valid_cell?(coordinates)
        end
        @current_player = switch_player(@current_player)
      end
    end

    # Uses the @coordinates variable to change the cell's state to
    # the player's mark, thus changing the board state
    def change_board(coordinates)
      @board.cells[coordinates[0]][coordinates[1]].state = @current_player.mark
      @board.board_display = @board.create_board
      # TODO: FIX BUG HERE. Somehow all cells are being changed!
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
      @current_player = @player1
    end

    # Returns true if game is over and false otherwise
    def gameover?
    end

    # Returns an array of coordinates of the cell the player wants to mark
    def take_turn(player)
      puts "#{player.name} ('#{player.mark}'), it's your turn."
      puts
      puts "What cell do you want to place your '#{player.mark}'? "\
           "(Choose a cell number from 1-9)"
      print ">> "
      cell = get_input
      return if quit_or_restart?(cell)
      cell
    end

    # Returns valid input when the user is prompted
    def get_input
      input = gets.chomp
      until valid_input?(input)
        puts "Invalid input. Please type in an EMPTY cell number from "\
             "1-9, 'quit', or 'restart'."
        print ">> "
        input = gets.chomp
      end
      input
    end

    # Returns true if the input is valid (quit, restart, or coordinates)
    def valid_input?(input)
      if 1 <= input.to_i && input.to_i <= 9
        coordinates = get_coordinates(input)
        valid_cell?(coordinates)
      elsif input.downcase == "quit" || input.downcase == "restart"
        true
      else
        false
      end
    end

    # Returns an array of coordinates given a cell number
    def get_coordinates(cell)
      row = @cell_coordinates[cell][0]
      col = @cell_coordinates[cell][1]
      [row, col]
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