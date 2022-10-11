class CreateLakes < ActiveRecord::Migration[5.2]
  def change
    create_table :lakes do |t|
      t.string :name
      t.integer :max_depth
      t.boolean :allows_public_fishing
      t.timestamps
    end
  end
end
