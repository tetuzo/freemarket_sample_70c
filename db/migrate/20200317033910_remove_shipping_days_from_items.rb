class RemoveShippingDaysFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_days, :string
  end
end
