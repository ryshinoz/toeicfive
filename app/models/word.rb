class Word < ActiveRecord::Base
  has_many :examination_words
  has_many :examinations, :through => :examination_words 
  
  scope :not_complete,->{where('is_complete =?', false)}

  validates :name ,presence:true, uniqueness:true

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
