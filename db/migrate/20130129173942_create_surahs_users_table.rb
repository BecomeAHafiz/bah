class CreateSurahsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :surahs_users, :id => false do |t|
      t.references :surah
      t.references :user
    end
    add_index :surahs_users, [:surah_id, :user_id]
    add_index :surahs_users, [:user_id, :surah_id]
  end

  def self.down
    drop_table :surahs_users
  end
end
