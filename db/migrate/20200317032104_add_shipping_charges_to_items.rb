class AddShippingChargesToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipping_charges_id, :integer
  end
end
