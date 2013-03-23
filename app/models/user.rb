#coding: utf-8

class User < ActiveRecord::Base
  
  has_many :answers

  def self.create_facebook_account(auth)
    @user          = User.new
    @user.uid      = auth[:uid]
    @user.provider = auth[:provider]
    unless auth[:info].blank?
      @user.name        = auth[:info][:name]
      @user.screen_name = auth[:info][:nickname]
      @user.image_path  = auth[:info][:image]
    end
    unless auth["credentials"].blank?
      @user.token=auth["credentials"]["token"]
    end
    @user.save
    @user
  end

  def answer_examination(examination_id,word_ids)
    ActiveRecord::Base.transaction do
     Answer.delete_all(['examination_id = ? and user_id = ?',examination_id , self.id])
     #2応えられていた単語が他のユーザも答えられているかチェックし、答えられていればis_completeフラグを帰る
     answers = []
     word_ids.each do |word|
       @answer = Answer.new
       @answer.user_id        = self.id
       @answer.word_id        = word
       @answer.examination_id = examination_id
       answers << @answer
     end 
     Answer.import answers
    end
  end
 

end
