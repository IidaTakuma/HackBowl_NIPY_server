class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
    add_index :friendships, :follower_id
    add_index :friendships, :following_id
    add_index :friendships, %i[follower_id following_id], unique: true
  end
end
