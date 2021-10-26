class RemoveLocationIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :Location_id, :integer
  end
end
