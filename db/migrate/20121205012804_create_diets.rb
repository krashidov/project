class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :name
      t.string :time
      t.text :info
      t.integer :user_id

      t.timestamps
    end
  end
end
