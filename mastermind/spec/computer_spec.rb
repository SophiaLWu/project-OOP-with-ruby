require "spec_helper"

module Mastermind
  describe Computer do

    context "#initialize" do
      it "does not raise an error when initialized without arguments" do
        expect { Computer.new }.to_not raise_error
      end
    end

    # context "#clues" do
    #   it "returns an object that maps clue type "\
    #      "(correct or correct_color) to a number" do
    #     comp = Computer.new
    #     expect(comp.clues) == {correct: 0, correct_color: 0}
    #   end

    #   it "allows the changing of the clues objects' values" do
    #     comp = Computer.new
    #     comp.clues[:correct] += 2
    #     comp.clues[:correct_color] += 1
    #     expect(comp.clues) == {correct: 2, correct_color: 1}
    #   end
    # end

  end
end