class CreateTfriends < ActiveRecord::Migration
  def change
    create_table :tfriends do |t|
      t.integer :friend_id
      t.integer :friends_id

      t.timestamps
    end
    
    add_index :tfriends, :friend_id
    add_index :tfriends, :friends_id
    add_index :tfriends, [:friend_id, :friends_id], unique: true
  end
end
