class CreateAvecs < ActiveRecord::Migration
  def change
    create_table :avecs do |t|

      t.timestamps
    end
  end
end
