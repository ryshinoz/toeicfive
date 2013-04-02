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
       if Answer.where('word_id = ?',w).group('user_id').count == user_count
         word = Word.find(w)
         word.is_complete = true
       end
     end
  end

end
