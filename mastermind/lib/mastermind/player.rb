module Mastermind

  # Represents a single human player in the game that will guess the code
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
    end

  end

end