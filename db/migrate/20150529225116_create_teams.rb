class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :program, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
