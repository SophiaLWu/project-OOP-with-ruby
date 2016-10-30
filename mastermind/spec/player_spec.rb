require "spec_helper"

module Mastermind
  describe Player do

    context "#initialize" do
      it "does not raise an error when initialized with a name" do
        expect { Player.new("Bobby Brown") }.to_not raise_error
      end

      it "raises an error when initialized without arguments" do
        expect { Player.new }.to raise_error(ArgumentError)
      end
    end

    context "#name" do
      it "returns the name of a player" do
        player = Player.new("Bobby")
        expect(player.name).to eq("Bobby")
      end
    end

  end
end