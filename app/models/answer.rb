#coding:utf-8

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :examination
  
end
