class AddSellerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :seller, :integer
  end
end
