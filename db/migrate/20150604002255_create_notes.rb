class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :day, index: true, foreign_key: true
      t.references :workout, index: true, foreign_key: true
      t.string :text

      t.timestamps null: false
    end
  end
end
