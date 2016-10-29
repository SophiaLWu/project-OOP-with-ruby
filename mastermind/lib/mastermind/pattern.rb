module Mastermind

  # Represents a single pattern block of 4 colored pegs
  class Pattern
    attr_reader :colors

    # Color arguments are symbols
    def initialize(color1, color2, color3, color4)
      @colors = [color1, color2, color3, color4]
    end

  end

end