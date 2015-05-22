class AddDayToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :day, :integer
  end
end
