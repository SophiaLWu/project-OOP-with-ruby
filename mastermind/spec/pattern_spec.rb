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
        expect(pattern.colors) == []
      end
    end

    context "#add_color" do
      it "can convert a full color string to an upcase symbol and add it to "\
         "the colors array" do
          pattern = Pattern.new
          pattern.add_color("red")
          expect(pattern.colors) == [:R]
      end 

      it "can convert an abbreviated color string to an upcase symbol and "\
         "add it to the colors array" do
          pattern = Pattern.new
          pattern.add_color("g")
          expect(pattern.colors) == [:G]
      end
    end

  end
end