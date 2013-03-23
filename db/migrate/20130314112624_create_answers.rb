class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id, null:false
      t.integer :examination_id, null:false
      t.integer :word_id, null:false
      t.timestamps
    end
  end
end
