class CreateRecitators < ActiveRecord::Migration
  def change
    create_table :recitators do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
