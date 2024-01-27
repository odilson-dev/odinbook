class DropFollows < ActiveRecord::Migration[7.1]
  def change
    drop_table :follows
  end
end
