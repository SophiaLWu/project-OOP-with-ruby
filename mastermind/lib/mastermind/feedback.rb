module Mastermind

  # Represents feedback that corresponds to one guessed pattern
  class Feedback
    attr_accessor :clues

    def initialize
      @clues = {correct: 0, correct_color: 0}
      @turn = 1
      @secret_code = generate_secret_code
    end

    def take_turn
      until @turn == 12
        new_pattern = Pattern.new
        1.upto(4) do |slot|
          puts "What color would you like to place in Slot #{slot}?"
          input = gets.chomp
          new_pattern.add_color(input)
        end
      end
    end

    private

    def generate_secret_code

    end

  end

end