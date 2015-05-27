class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :day, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true
      t.string :hold
      t.string :reps
      t.string :sets
      t.string :timer

      t.timestamps null: false
    end
  end
end
