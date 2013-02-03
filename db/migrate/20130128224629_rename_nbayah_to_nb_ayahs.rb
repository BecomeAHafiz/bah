class RenameNbayahToNbAyahs < ActiveRecord::Migration
  def up
    rename_column :surahs, :Nbayah, :nbAyahs
  end

  def down
  end
end
