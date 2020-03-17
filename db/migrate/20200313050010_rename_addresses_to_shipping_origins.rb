class RenameAddressesToShippingOrigins < ActiveRecord::Migration[5.2]
  def change
    rename_table :addresses, :shipping_origin
  end
end
