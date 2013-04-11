require 'spec_helper'

describe User do
  fixtures :users
  fixtures :examinations
  fixtures :words
  fixtures :groups
  fixtures :user_groups

  describe "create_facebook_account  method test" do
    context "check account" do
      before do
        auth  = {provider:'facebook',uid:'aabbcc1122'}
        @user = User.create_facebook_account auth
      end
      it "check account information" do
        @user.should_not be_nil
        @user.uid.should eql("aabbcc1122")
      end
    end

    context "first login" do
      before do
        auth = {provider: 'facebook', uid:'test123456789'}
        @user = User.create_facebook_account auth
      end 
      it "check regist account" do
        @user.should_not be_nil
        @user.uid.should eql(@user.uid)
      end
    end
  end 

  describe "answer method test" do
    context "first answer " do
      before do
        auth  = {provider:'facebook',uid:'aabbcc1122'}
        @user = User.create_facebook_account(auth)
        @examination = Examination.find(1)
        @user.answer_examination @examination.id, [1,2,3,4,5]
      end 
      it "answer model check" do
        @user.answers.should_not be_nil
        @user.answers.where('examination_id = ?',@examination.id).should_not be_nil
      end 
      it "words check " do
        @user.answers.where('examination_id = ?',@examination.id).size.should eql(5)
      end
    end 
    context "second answer " do
      before do
        auth  = {provider:'facebook',uid:'aabbcc1122'}
        @user = User.create_facebook_account(auth)
        @examination = Examination.find(1)
        @user.answer_examination @examination.id, [1,2,3,4,5]
      end 
      it "answer model check " do
        @user.answer_examination @examination.id, [1,2,3,4,5,6]
        @user.answers.should_not be_nil
        @user.answers.where('examination_id = ?',@examination.id).should_not be_nil
        @user.answers.where('examination_id = ?',@examination.id).size.should eql(6)
      end 
      it "word status check" do
        @examination = Examination.find(@examination.id)
        exam_words = @examination.words
        exam_words.each do |w|
          p w.is_complete
        end
        word = Word.find(1)
        word.is_complete.should be_false
        word = Word.find(2)
        word.is_complete.should be_true
        word = Word.find(3)
        word.is_complete.should be_false
        word = Word.find(4)
        word.is_complete.should be_false
        word = Word.find(5)
        word.is_complete.should be_false
        word = Word.find(6)
        word.is_complete.should be_false
      end
    end
  end

  describe 'user group test' do
    before do
      @user = User.find(1)
    end 
    it "group data is not nil" do
      @user.should_not be_nil
      @user.groups.should_not be_nil
    end 
    it "group size check" do
      @user.groups.size.should eql(1)
    end
    it "group member size check" do
      @user.groups[0].users.size.should eql(3)
    end

  end

end
