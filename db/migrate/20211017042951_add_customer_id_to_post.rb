class AddCustomerIdToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :customer_id, :integer
  end
end
