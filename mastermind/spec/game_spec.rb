require "spec_helper"

module Mastermind
  class GameTest < Game # For testing, allow access to certain variables
    attr_accessor :turn, :player, :secret_code, :colors, :computer, :board
  end

  describe Game do

    context "#initialize" do
      it "does not raise an error when initialized with a player" do
        player = Player.new("Billy")
        expect { GameTest.new(player) }.to_not raise_error
      end

      it "raises an error when initialized without arguments" do
        expect { GameTest.new }.to raise_error(ArgumentError)
      end

      it "creates a new computer when intitialized" do
        g = GameTest.new("Billy")
        g.computer.instance_of? Computer
      end
      
      it "initializes @turn to 1" do
        g = GameTest.new("Billy")
        expect(g.turn).to eq(1)
      end

      it "initializes @colors to an array of colors" do
        g = GameTest.new("Billy")
        colors = ["red", "orange", "yellow", "green", "blue", "purple"]
        expect(g.colors).to eq(colors)
          
      end
    end

    context "#valid_input?" do
      it "returns true when a valid full color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("Blue")).to eq(true)
      end

      it "returns true when a valid abbreviated color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("P")).to eq(true)
      end

      it "returns true when a valid lowercase color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("orange")).to eq(true)
      end

      it "returns true when a valid lowercase abbreviated color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("g")).to eq(true)
      end

      it "returns false when an invalid color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("Indigo")).to eq(false)
      end

      it "returns false when an invalid color that starts with "\
         "the same letter as a valid color is provided" do
        g = GameTest.new("Billy")
        expect(g.valid_input?("black")).to eq(false)
      end
    end

    context "#win?" do
      it "returns false when the board is empty" do
        g = GameTest.new("Billy")
        expect(g.win?).to eq(false)
      end

      it "returns true when the codebreaker has guessed the secret code" do
        g = GameTest.new("Billy")
        g.secret_code = Pattern.new
        g.secret_code.generate_random_pattern(g.colors)
        g.computer = Computer.new("codemaker")
        feedback = g.computer.give_feedback(g.secret_code, g.secret_code)
        g.board.add_block(g.secret_code, feedback)
        expect(g.win?).to eq(true)
      end
    end

  end
end