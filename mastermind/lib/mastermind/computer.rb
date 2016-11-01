module Mastermind

  # Represents the computer player
  class Computer

    def initialize(role)
      @role = role
    end


    #### COMPUTER AS CODEMAKER #### 

    # Given a guess and the secret code, computer will create a
    # clue object and incremement the counts of the clues appropriately
    def give_feedback(guess, code)
      code_colors = code.colors.dup
      guess_colors = guess.colors.dup
      clues = new_clues
      clues = increment_correct_slot(guess_colors, code_colors, clues)
      clues = increment_correct_color(guess_colors, code_colors, clues)
      clues
    end

    # Finds any completely correct slots and increments :correct_slot
    # in the clues object
    def increment_correct_slot(guess, code, clues)
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
    def increment_correct_color(guess, code, clues)
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


    #### COMPUTER AS CODEBREAKER #### 

    public

    # Given a secret code, array of guesses, and all possible colors,
    # returns a new guess
    def give_pattern(code, all_guesses, possible_colors)
      new_pattern = Pattern.new
      0.upto(3) do |slot|
        if correct_slot?(code, all_guesses, slot)
          new_pattern.add_color(code.colors[slot])
        else
          new_pattern.add_color(possible_colors.sample)
        end
      end

      new_pattern
    end

    # Given a code, an array of guesses and a slot number, determines
    # if a certain slot was correct in any of the previous guesses
    def correct_slot?(code, guesses, slot)
      guesses.each do |guess|
        return true if guess.colors[slot] == code.colors[slot]
      end
      false
    end

  end

end