class AddDayNameToWorkout < ActiveRecord::Migration
  def change
    add_column :workouts, :day_name, :string
  end
end
