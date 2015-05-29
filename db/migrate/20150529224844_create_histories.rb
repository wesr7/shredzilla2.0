class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :program, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
