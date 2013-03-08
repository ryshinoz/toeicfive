class Word < ActiveRecord::Base

  def self.random_words
    Word.where('is_complete = ?', false).order('RAND()').limit(1)
  end

end
