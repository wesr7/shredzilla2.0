class RemoveRepsFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :reps, :string
  end
end
