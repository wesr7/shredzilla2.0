class RemoveExerciseIdFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :exercise_id, :integer
  end
end
