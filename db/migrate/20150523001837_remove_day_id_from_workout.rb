class RemoveDayIdFromWorkout < ActiveRecord::Migration
  def change
    remove_column :workouts, :day_id, :integer
  end
end
