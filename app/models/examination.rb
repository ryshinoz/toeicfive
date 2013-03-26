#coding: utf-8
require 'exceptions/examination_error.rb'

class Examination < ActiveRecord::Base
  has_many :examination_words
  has_many :words, :through =>:examination_words
  has_one :answer

  validates :test_day, presence: true, uniqueness: true


  def self.today_examination
    begin
      Examination.where('test_day = ?', Time.now.strftime("%Y-%m-%d")).first_or_create do |ex|
        ex.words    = Word.random_words
        ex.test_day = Time.now.strftime("%Y-%m-%d")
      end 
    rescue 
      raise  Toeicfive::ExaminationError "Cant not create examination."
    end
  end
end 


