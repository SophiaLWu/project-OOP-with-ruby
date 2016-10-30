module Mastermind

  # Represents the computer player
  class Computer

    def initialize
    end

    # Given a guess and the secret code, computer will increase the
    # clue counts of @clues appropriately and return the @clues array
    def give_feedback(guess, code)
      code_colors = code.colors.dup
      guess_colors = guess.colors.dup
      clues = new_clues
      correct_colors = []
      guess_colors.each_with_index do |color, index|
        if color == code_colors[index]
          clues[:correct] += 1
          code_colors[index] = nil # Won't be included for next testing
          guess_colors[index] = nil # Same
        end
      end 
      guess_colors.each_with_index do |color, index|
        if !color.nil? && code_colors.include?(color) && 
           !correct_colors.include?(color)
          clues[:correct_color] += 1
          correct_colors << color
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