class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :timer
      t.string :hold
      t.string :reps
      t.string :sets
      t.integer :exercise_id
      t.integer :day_id

      t.timestamps null: false
    end
  end
end
