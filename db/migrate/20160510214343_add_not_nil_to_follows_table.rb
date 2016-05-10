class AddNotNilToFollowsTable < ActiveRecord::Migration
  def change
    change_column_null :follows, :follower_id, false
    change_column_null :follows, :following_id, false
  end
end
