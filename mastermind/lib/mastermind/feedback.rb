module Mastermind

  # Represents feedback that corresponds to one guessed pattern
  class Feedback
    attr_accessor :clues

    def initialize
      @clues = {black: 0, white: 0}
    end

  end

end