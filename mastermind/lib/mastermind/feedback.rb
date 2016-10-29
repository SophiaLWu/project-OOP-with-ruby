module Mastermind

  # Represents feedback that corresponds to one guessed pattern
  class Feedback
    attr_accessor :clues

    def initialize
      @clues = {correct: 0, correct_color: 0}
    end

  end

end