module Mastermind

  # Represents one game of mastermind and adds functionality for gameplay
  class Game
    attr_reader :turn, :player, :secret_code, :colors, :computer

    def initialize(player)
      @player = player
      @board = Board.new
      @turn = 1
      @computer = Computer.new
      @colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
      @secret_code = generate_secret_code
      @win = false
    end

    # Allows the game to be played
    def play
      until @turn > 12 || win?
        take_turn
        @turn += 1
      end

      puts @board.formatted_board
      puts "The secret code was #{@secret_code.pretty_print}"
      ending_screen
    end

    # Allows one turn to proceed with a new block being added to the board
    def take_turn
      puts "TURN #{@turn}"
      puts @board.formatted_board
      guess = new_user_pattern
      feedback = @computer.give_feedback(guess, @secret_code)
      @board.add_block(guess, feedback)
    end

    # Returns a new pattern (guess) created by user inputs
    def new_user_pattern
      new_pattern = Pattern.new
      1.upto(4) do |slot|
        puts "What color would you like to place in Slot #{slot}?"
        input = gets.chomp
        new_pattern.add_color(input)
      end
      new_pattern
    end

    # Returns true if player has won game and sets win variable to true
    def win?
      if @board.board_items.empty? # When board is empty
        false
      elsif @board.board_items.last[0].colors == @secret_code.colors
        @win = true
        true
      else
        false
      end
    end

    # Ending screen output
    def ending_screen
      if @win
        puts "Congrats, you figured out the secret code! You won!"
      else
        puts "Sorry, you couldn't figure out the secret code. You lost."
      end

      puts "Play again? (Y/N)"
      output = gets.chomp
      restart_game if output.downcase == "y"
    end

    # Restarts the game with a new board and new code
    def restart_game
      @board = Board.new
      @turn = 1
      @computer = Computer.new
      @colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
      @secret_code = generate_secret_code
      @win = false
      play
    end

    private

    # Returns a randomly generated secret code
    def generate_secret_code
      secret_code = Pattern.new
      4.times do
        secret_code.add_color(@colors.sample)
      end
      secret_code
    end

  end

end