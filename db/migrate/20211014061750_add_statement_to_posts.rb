class AddStatementToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :statement, :text
  end
end
