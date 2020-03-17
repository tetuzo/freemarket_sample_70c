class RemoveShippingChargesFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :shipping_charges, :string
  end
end
