class Word < ActiveRecord::Base

  def self.random_words
    #Word.where('is_complete = ?', false)..limit(1)
    Word.where('is_complete = ?', false).offset(rand(Word.count)).limit(5)
  end

end
