require 'spec_helper'

describe ExaminationController do
  fixtures :words
  fixtures :examinations
  fixtures :examination_words

  describe "today_word method" do
    context "today word list" do
      before do
        get 'today_word'
      end
      it "response check" do
       response.should be_success
       assigns[:examination].should_not be_nil
       assigns[:examination].words eql(20)
      end
    end 
  end
end
