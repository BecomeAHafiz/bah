class CreateAyahsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :ayahs_users, :id => false do |t|
      t.references :ayah
      t.references :user
    end
    add_index :ayahs_users, [:ayah_id, :user_id]
    add_index :ayahs_users, [:user_id, :ayah_id]
  end

  def self.down
    drop_table :ayahs_users
  end
end
