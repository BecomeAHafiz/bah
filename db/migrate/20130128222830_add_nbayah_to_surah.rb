class AddNbayahToSurah < ActiveRecord::Migration
  def change
    add_column :surahs, :Nbayah, :integer

  end
end
