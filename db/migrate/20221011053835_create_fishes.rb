class CreateFishes < ActiveRecord::Migration[5.2]
  def change
    create_table :fishes do |t|
      t.string :name
      t.integer :avg_length
      t.boolean :catch_and_release_only
      t.references :lake, foreign_key: true
      
      t.timestamps
    end
  end
end
