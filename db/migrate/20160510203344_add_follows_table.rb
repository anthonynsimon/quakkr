class AddFollowsTable < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true, foreign_key: true
      t.references :following, index:true, foreign_key: true
      
      t.timestamps null: false
    end
    
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
