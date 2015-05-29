class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :history, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :day
      t.integer :food
      t.integer :workout
      t.integer :sleep
      t.integer :challenge
      t.integer :daily_update

      t.timestamps null: false
    end
  end
end
