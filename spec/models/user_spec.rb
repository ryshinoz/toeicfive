require 'spec_helper'

describe User do
  fixtures :users
  fixtures :examinations
  fixtures :words

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
    end
  end
end
