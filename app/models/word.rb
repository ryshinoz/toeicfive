class Word < ActiveRecord::Base
  has_many :examination_words
  has_many :examinations, :through => :examination_words 
  
  scope :not_complete,->{where('is_complete =?', false)}

  validates :name ,presence:true, uniqueness:true

  def self.random_words
    @words = Word.not_complete
    count  = Word.not_complete.count
    if count > Settings.word_limit
      @words = @words.offset(rand(count - Settings.word_limit))
    end 
    @words = @words.limit Settings.word_limit
  end
 
  #TODO ここ改修
  def self.complete_check
    #全員回答済みだったら
    @user_ids = User.all.select(:id)
    @answered_user_ids = Answer.where("word_id = ?", self.id).group(:user_id).select(:user_id)
    if @user_ids == @answered_user_ids
      @word.is_complete = true
      @word.save
    end
#    @users.each do|u|
#      Answeru.where("user_id = ?",u.id).where("word_id = ?", self.id).exists
#    end
#    @word.is_complete = true
#    @word.save
  end

end
