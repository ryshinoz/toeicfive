class CreateExaminationWords < ActiveRecord::Migration
  def change
    create_table :examination_words do |t|
      t.integer :examination_id
      t.integer :word_id

      t.timestamps
    end
  end
end
