class AddPoistionToSurah < ActiveRecord::Migration
  def change
    add_column :surahs, :position, :integer

  end
end
