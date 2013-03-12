class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.date :test_day,null:false

      t.timestamps
    end
  end
end
