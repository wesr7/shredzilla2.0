class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.references :program, index: true, foreign_key: true
      t.integer :day
      t.string :description
      t.string :option_1
      t.string :option_2

      t.timestamps null: false
    end
  end
end
