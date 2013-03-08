class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name, null: false
      t.string :japanese, null: false
      t.boolean :is_complete, null: false

      t.timestamps
    end
  end
end
