class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.string :time
      t.text :info
      t.integer :diet_id

      t.timestamps
    end
  end
end
