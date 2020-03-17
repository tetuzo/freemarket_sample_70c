class AddShippingDaysToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_days_id, :integer
  end
end
