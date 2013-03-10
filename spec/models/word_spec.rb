#coding: utf-8

require 'spec_helper'

describe Word do
  fixtures :words
  describe "random_words method test"do
    context "random_words method return value " do
      before do
        @words = Word.random_words
        p @words
      end
      it "return value not nil" do
        @words.should_not be_nil
      end 
      it "return value size check" do
        @words.size.should eql(20)
      end
    end 
    context "some data is_complete column update" do
      before do
        @word = Word.where('name =?','Nakamura').first
        @word.is_complete = true
        @word.save

        @word = Word.where('name = ?','Shinozaki').first
        @word.is_complete = true
        @word.save

        @word = Word.where('name = ?','Irokawa').first
        @word.is_complete = true
        @word.save
      end
      it "return value size check" do
         Word.random_words.size.should eql(19)
      end
    end
  end
end
