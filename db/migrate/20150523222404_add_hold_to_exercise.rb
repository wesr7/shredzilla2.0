class AddHoldToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :hold, :string
  end
end
