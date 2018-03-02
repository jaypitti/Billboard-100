class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.string :artwork
      t.integer :artist_id

      t.timestamps
    end
  end
end
