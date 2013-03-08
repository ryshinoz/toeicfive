require 'spec_helper'

describe Word do
  fixtures :words
  context "aaa" do
    before do
      @words = Word.random_words
    end
    it do
      @words.should_not be_nil
      @words.size.should eql(1)
    end
  end
end
