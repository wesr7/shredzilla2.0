class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
    add_index :identities, :provider
    add_index :identities, :uid
    add_index :identities, [:provider, :uid], unique: true
  end
end
