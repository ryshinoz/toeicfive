#coding: utf-8

class Examination < ActiveRecord::Base
  has_many :examination_words
  has_many :words, :through =>:examination_words

  validates :test_day, presence: true, uniqueness: true
end 


