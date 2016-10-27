module TicTacToe

  # Represents a single human player
  class Player
    attr_reader :name
    attr_accessor :turn

    def initialize(name, turn)
      @name = name
      @turn = false
    end

  end

end