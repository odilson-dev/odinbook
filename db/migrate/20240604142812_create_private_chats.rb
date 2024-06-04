class CreatePrivateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :private_chats do |t|
      t.references :profile1, null: false, foreign_key: { to_table: :profiles }
      t.references :profile2, null: false, foreign_key: { to_table: :profiles }
      
      t.timestamps
    end
    add_foreign_key "private_chats", "profiles", column: "profile1_id"
    add_foreign_key "private_chats", "profiles", column: "profile2_id"
  end
end
