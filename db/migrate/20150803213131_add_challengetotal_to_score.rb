class AddChallengetotalToScore < ActiveRecord::Migration
  def change
    add_column :scores, :challengetotal, :integer
  end
end
