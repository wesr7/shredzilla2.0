class RemoveHoldFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :hold, :string
  end
end
