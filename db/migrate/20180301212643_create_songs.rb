class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.string :artwork
      t.string :artist

      t.timestamps
    end
  end
end
