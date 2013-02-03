class AddPositionToAyah < ActiveRecord::Migration
  def change
    add_column :ayahs, :position, :integer

  end
end
