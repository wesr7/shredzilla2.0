class AddNoteToScores < ActiveRecord::Migration
  def change
    add_column :scores, :note, :string
  end
end
