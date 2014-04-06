require 'spec_helper'

module Emotion
  describe Lexicon do
    describe ".count" do
      it "returns the total number of lexicons" do
        Lexicon.count.should == 6450
      end
    end

    describe ".find" do
      it "returns nil for unknown word" do
        Lexicon.find('unknown word').should be_nil
      end

      it "returns Lexicon object for matched word" do
        Lexicon.find('checklist').should be_an(Lexicon)
      end
    end
  end
end
