class CreateChallengeProgramJoinTable < ActiveRecord::Migration
  def change
    create_join_table :challenges, :programs do |t|
      # t.index [:challenge_id, :program_id]
      # t.index [:program_id, :challenge_id]
    end
  end
end
