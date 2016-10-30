module Mastermind

  # Represents the computer player
  class Computer

    def initialize
    end

    # Given a guess and the secret code, computer will create a
    # clue object and incremement the counts of the clues appropriately
    def give_feedback(guess, code)
      code_colors = code.colors.dup
      guess_colors = guess.colors.dup
      clues = new_clues
      clues = find_correct_slot(guess_colors, code_colors, clues)
      clues = find_correct_color(guess_colors, code_colors, clues)
      clues
    end

    # Finds any completely correct slots and increments :correct_slot
    # in the clues object
    def find_correct_slot(guess, code, clues)
      guess.each_with_index do |color, index|
        if color == code[index]
          clues[:correct_slot] += 1
          code[index] = nil # Won't be included for next testing
          guess[index] = nil # Same
        end
      end 

      clues
    end

    # Finds any correct colors and increments :correct_color
    # in the clues object
    def find_correct_color(guess, code, clues)
      correct_colors = [] # To prevent duplicate colors from giving clues
      guess.each_with_index do |color, index|
        if !color.nil? && code.include?(color) && 
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
      {correct_slot: 0, correct_color: 0}
    end

  end

end