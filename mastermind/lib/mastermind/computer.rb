module Mastermind

  # Represents the computer player
  class Computer
    # attr_accessor :clues

    def initialize
      # @clues = {correct: 0, correct_color: 0}
    end

    # Given a guess and the secret code, computer will increase the
    # clue counts of @clues appropriately and return the @clues array
    def give_feedback(guess, code)
      temp_code = code.colors.dup
      clues = new_clues
      guess.colors.each_with_index do |color, index|
        if color == temp_code[index]
          clues[:correct] += 1
          temp_code[index] = nil # Won't be included in test for correct color 
        elsif temp_code.include? color
          clues[:correct_color] += 1
        end
      end

      clues
    end

    private

    # Returns a new set of clues
    def new_clues
      {correct: 0, correct_color: 0}
    end

  end

end