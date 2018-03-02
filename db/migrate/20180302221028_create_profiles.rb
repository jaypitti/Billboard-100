class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.string :profile_pic
      t.string :bio

      t.timestamps
    end
  end
end
