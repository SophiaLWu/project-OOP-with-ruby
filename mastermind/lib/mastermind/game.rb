module Mastermind

  # Represents one game of mastermind and adds functionality for gameplay
  class Game

    def initialize(player)
      @player = player
      @board = Board.new
      @turn = 1
      @computer = Computer.new
      @colors = ["red", "orange", "yellow", "green", "blue", "purple"]
      @secret_code = generate_secret_code
      @win = false
    end

    # Starts and goes through one game of maastermind
    def play
      instructions

      # puts @secret_code.colors # TESTING ONLY
      until @turn > 12 || win?
        take_turn
        @turn += 1
      end

      ending_screen
    end

    # Displays the instructions
    def instructions
      puts """\nHello! Welcome to Mastermind!
      \nYou have 12 turns to guess a secret 4 color code made up of:
        Red (R)             Green (G)
        Orange (O)          Blue (B)
        Yellow (Y)          Purple (P)
      \nEach turn, you will enter your 4 color guess in 4 slots.
      \nThe computer will then give you feedback about your guess.
        1. The number of correct slots
        2. The number of correct colors
      \nGood Luck!"""
    end

    # Allows one turn to proceed with a new block being added to the board
    def take_turn
      puts " \n" + "=" * 67
      puts "TURN #{@turn} \n \n"
      puts @board.formatted_board
      guess = new_user_pattern
      feedback = @computer.give_feedback(guess, @secret_code)
      @board.add_block(guess, feedback)
    end

    # Returns a new pattern (guess) created by user inputs
    def new_user_pattern
      new_pattern = Pattern.new
      1.upto(4) do |slot|
        puts "What color would you like to place in Slot #{slot}? "\
             "(R, O, Y, G, B, P)"
        print ">> "
        input = gets.chomp
        until valid_input?(input)
          puts "Invalid color! Choose from R, O, Y, G, B, P."
          print ">> "
          input = gets.chomp
        end
        new_pattern.add_color(input)
      end
      new_pattern
    end

    # Returns true if input is valid
    def valid_input?(input)
      if input.length == 1 # When user gives abbreviated color
        @colors.any? { |color| color[0] == input.downcase }
      else # When user gives full color
        @colors.include? input.downcase
      end
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

    private

    # Ending screen output
    def ending_screen
      puts " \n" + "=" * 67
      puts" \nThe game is over!\n \n"
      puts @board.formatted_board
      puts "The secret code was '#{@secret_code.pretty_print}'."

      dependent_ending_screen

      puts " \nPlay again? (Y/N)"
      print ">> "
      output = gets.chomp
      restart_game if output.downcase == "y"
    end

    # Ending screen depending on win or not
    def dependent_ending_screen
      if @win
        puts " \nYOU WON!!\n"
        puts "Congrats, you figured out the secret code!"
      else
        puts" \nYOU LOST.\n"
        puts "Sorry, you couldn't figure out the secret code."
      end
      
    end
    
    # Restarts the game with a new board and new code
    def restart_game
      @board = Board.new
      @turn = 1
      @computer = Computer.new
      @secret_code = generate_secret_code
      @win = false
      play
    end

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