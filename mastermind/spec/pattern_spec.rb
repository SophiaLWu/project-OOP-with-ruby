require "spec_helper"

module Mastermind
  describe Pattern do

    context "#initialize" do
      it "does not raise an error when initialized with 4 colors" do
        expect { Pattern.new(:red, :green, :blue, :purple) }.to_not raise_error
      end

      it "raises an error when initialized without arguments" do
        expect { Pattern.new }.to raise_error(ArgumentError)
      end
    end

    context "#colors" do
      it "returns an array of colors" do
        pattern = Pattern.new(:red, :green, :blue, :purple)
        expect(pattern.colors) == [:red, :green, :blue, :purple]
      end
    end

  end
end