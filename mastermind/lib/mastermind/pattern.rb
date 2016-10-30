module Mastermind

  # Represents a single pattern block of 4 colored pegs
  class Pattern
    attr_reader :colors

    def initialize
      @colors = []
    end

    # Adds colors to the colors array by converting the given string
    # color to a single uppercase letter symbol
    def add_color(color)
      @colors << color.upcase[0].to_sym # Allows user to both type in the full
    end                                 # color name or abbreviated color

    # Returns a string of the pattern
    def pretty_print
      s = (@colors.map do |color|
        case color
        when :R
          "Red"
        when :O
          "Orange"
        when :Y
          "Yellow"
        when :G
          "Green"
        when :B
          "Blue"
        else
          "Purple"
        end
      end).join(" ")
    end

  end

end