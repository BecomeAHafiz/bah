class CreateSurahs < ActiveRecord::Migration
  def change
    create_table :surahs do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
