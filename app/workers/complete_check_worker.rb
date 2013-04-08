class CompleteCheckWorker
#  include Sidekiq::Worker
#
#  def perform
#     p 'worker !' 
#  end 
  def work(word_ids, user_count)
     p 'worker !' 
     #today_examination に含まれているwordの正解件数をみる。
     #全ての人が正解だったらis_completeフラグを変える 
     word_ids.each do|w|
       word = Word.find(w)
       if Answer.where('word_id = ?',w).group('user_id').count == user_count
         word.is_complete = true 
         word.save
       end
     end

  end

end
