#coding: utf-8

class User < ActiveRecord::Base


  def self.create_facebook_account(auth)
    @user          = User.new
    @user.uid      = auth["uid"]
    @user.provider = auth["provider"]
    unless auth["info"].blank?
      @user.name        = auth["info"]["name"]
      @user.screen_name = auth["info"]["nickname"]
      @user.image_path  = auth["info"]["image"]
    end
    unless auth["credentials"].blank?
      @user.token=auth["credentials"]["token"] 
      @user.secret=auth["credentials"]["secret"] 
    end
    @user.save 
    @user
  end
end
