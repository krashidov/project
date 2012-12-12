class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :time
      t.string :workout_type
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
