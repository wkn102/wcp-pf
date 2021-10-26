class AddCustomerIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :customer_id, :integer
  end
end
