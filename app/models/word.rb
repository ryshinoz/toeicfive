class Word < ActiveRecord::Base
  scope :not_complete,->{where('is_complete =?', false)}

  def self.random_words
    @words = Word.not_complete
    count = Word.not_complete.count
    if count > 20
      @words.offset(rand(count - 20))
    end 
    @words.limit 20
    #Word.not_complete.offset(rand(Word.not_complete.count)).limit(20)
  end

end
