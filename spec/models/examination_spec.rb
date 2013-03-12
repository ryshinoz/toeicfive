require 'spec_helper'

describe Examination do
  fixtures :examinations
  fixtures :words
  fixtures :examination_words

  describe "examination.words method check" do
    context "return value check" do
      before do
        @test = Examination.find(1)
      end
      it "words check" do
        @test.words.should_not be_nil
        @test.words.size.should eql(3)
      end
    end

  end

end
