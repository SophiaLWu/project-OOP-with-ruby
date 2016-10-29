require "spec_helper"

module Mastermind
  describe Game do

    context "#initialize" do
      it "does not raise an error when initialized with a player" do
        player = Player.new("Billy")
        expect { Game.new(player) }.to_not raise_error
      end

      it "raises an error when initialized without arguments" do
        expect { Game.new }.to raise_error(ArgumentError)
      end

      it "creates a new computer when intitialized" do
        g = Game.new("Billy")
        g.computer.instance_of? Computer
      end
      
      it "initializes @turn to 1" do
        g = Game.new("Billy")
        expect(g.turn) == 1
      end

      it "initializes @colors to an array of colors" do
        g = Game.new("Billy")
        expect(g.colors) == \
          ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
      end
    end

    context "#generate_secret_code" do
      it "returns a randomly generated pattern of four colors" do
        g = Game.new("Jonas")
        expect(g.secret_code.colors.size) == 4
        only_colors = g.secret_code.colors.all? do |color|
          color == :R || color == :O || color == :Y || color == :G ||
          color == :B || color == :P
        end
        expect(only_colors) == true
      end
    end

    

  end
end