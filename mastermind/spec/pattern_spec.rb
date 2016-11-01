require "spec_helper"

module Mastermind
  describe Pattern do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Pattern.new }.to_not raise_error
      end

      it "raises an error when initialized with arguments" do
        expect { Pattern.new("r") }.to raise_error(ArgumentError)
      end
    end

    context "#colors" do
      it "returns an empty array after initialized" do
        pattern = Pattern.new
        expect(pattern.colors).to eq([])
      end
    end

    context "#add_color" do
      it "can convert a full color string to an upcase symbol and add it to "\
         "the colors array" do
          pattern = Pattern.new
          pattern.add_color("red")
          expect(pattern.colors).to eq([:R])
      end 

      it "can convert an abbreviated color string to an upcase symbol and "\
         "add it to the colors array" do
          pattern = Pattern.new
          pattern.add_color("g")
          expect(pattern.colors).to eq([:G])
      end
    end

    context "#generate_random_pattern" do
      it "returns a randomly generated pattern of four colors" do
        pattern = Pattern.new
        colors = ["red", "orange", "yellow", "green", "blue", "purple"]
        random = pattern.generate_random_pattern(colors)
        expect(pattern.colors.size) == 4
        only_colors = pattern.colors.all? do |color|
          color == :R || color == :O || color == :Y || color == :G ||
          color == :B || color == :P
        end
        expect(only_colors).to eq(true)
      end
    end

  end
end