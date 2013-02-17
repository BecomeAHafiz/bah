class FixAyahId < ActiveRecord::Migration
  def up
    rename_column :surahs, :ayahId, :ayah_id
    rename_column :surahs, :surahId, :surah_id
  end

  def down
  end
end
