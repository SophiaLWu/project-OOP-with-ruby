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

    # Returns a string of the colors in the pattern
    def pretty_print
      s = @colors.map do |color|
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
      end
      .join(" ")
    end

    # Returns a string of the abbreivated colors in the pattern
    def print_abbreviated_colors
      @colors.map do |color|
        color.to_s
      end
      .join("  ")
    end

    # Generates a random pattern
    def generate_random_pattern(possible_colors)
      4.times do
        add_color(possible_colors.sample)
      end
    end

  end

end