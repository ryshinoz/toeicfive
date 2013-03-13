#coding: utf-8

class Examination < ActiveRecord::Base
  has_many :examination_words
  has_many :words, :through =>:examination_words

  validates :test_day, presence: true, uniqueness: true


  def self.today_examination
    begin
      Examination.where('test_day = ?', Time.now.strftime("%Y-%m-%d")).first_or_create do |ex|
        ex.words    = Word.random_words
        ex.test_day = Time.now.strftime("%y-%M-%d")
      end 
    rescue 
      logger.error "テスト作成に失敗しました"
    end
  end
end 


