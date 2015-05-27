class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :team, index: true, foreign_key: true
      t.references :day, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :food
      t.integer :workout
      t.integer :sleep
      t.integer :challenge
      t.integer :update

      t.timestamps null: false
    end
  end
end
