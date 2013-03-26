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
        @test.words.size.should eql(11)
      end 
    end
  end

  describe "Examination data create" do
    context "create examination normal test" do 
      before do
        @test = Examination.today_examination
      end
      it "return value not nil" do
        @test.should_not be_nil
      end 
      it "words not nil" do
        @test.words.should_not be_nil
      end 
      it "words size check" do
        @test.words.size.should be_close(20,19)
        @test.words.size.should eql(20)
      end 
      it "words check " do
        @test.words.each do|w|
          p w.name
        end
      end
    end 
    context "test_day is uniqueness. " do
       before do
         exam       = Examination.new
         exam.test_day = Time.now.strftime("%Y-%m-%d")
         exam.words = Word.random_words
         exam.save!
         @test = Examination.today_examination
       end 
       it "examination not duplication." do
         @test.should_not be_nil
         Examination.where("test_day = ?", Time.now.strftime("%Y-%m-%d")).count.should eql(1)
       end
    end 
    context "error handling" do
      it "exception" do
        proc{
          require 'exceptions/examination_error.rb'          
          class TestExamination < Examination
            def self.today_examination
              raise Toeicfive::ExaminationError
            end
          end 
          TestExamination.today_examination
        }.should raise_error(Toeicfive::ExaminationError)
      end
#      it "exception" do
#       lambda{Examination.today_examination}.should raise_error(Toeicfive::ExaminationError)
#      end
    end

  end

end
