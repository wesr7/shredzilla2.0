class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.date :start_date
      t.integer :current_day

      t.timestamps null: false
    end
  end
end
