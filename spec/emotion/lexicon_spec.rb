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

    describe "#word" do
      let :lexicon do
        Lexicon.find 'checklist'
      end

      it "returns the matched word" do
        lexicon.word.should == 'checklist'
      end
    end

    describe "#categories" do
      let :lexicon do
        Lexicon.find 'checklist'
      end

      it "returns the matched word" do
        lexicon.categories.should == Set.new(['trust', 'positive'])
      end
    end
  end
end
