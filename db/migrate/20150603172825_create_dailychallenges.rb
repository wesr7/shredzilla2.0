class CreateDailychallenges < ActiveRecord::Migration
  def change
    create_table :dailychallenges do |t|
      t.references :day, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
