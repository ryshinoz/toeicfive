class Word < ActiveRecord::Base
  scope :not_complete,->{where('is_complete =?', false)}

  def self.random_words
    @words = Word.not_complete
    count = Word.not_complete.count
    if count >Settings.word_limit
      @words.offset(rand(count - Settings.word_limit))
    end 
    @words.limit Settings.word_limit
    #Word.not_complete.offset(rand(Word.not_complete.count)).limit(20)
  end

end
