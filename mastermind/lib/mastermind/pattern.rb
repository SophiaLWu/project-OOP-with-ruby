module Mastermind

  # Represents a single pattern block of 4 colored pegs
  class Pattern
    attr_reader :colors # TODO: Do I need this?

    def initialize
      @colors = []
    end

    # Adds colors to the colors array by converting the given string
    # color to a single uppercase letter symbol
    def add_color(color)
      @colors << color.upcase[0].to_sym
    end

    def pretty_print
      s = @colors.map { |color| color.to_s }.join(" ")
    end

  end

end