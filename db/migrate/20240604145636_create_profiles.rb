class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :profile_picture

      t.timestamps
    end
  end
end
