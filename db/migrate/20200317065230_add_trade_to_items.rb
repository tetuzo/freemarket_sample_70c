class AddTradeToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :trade_id, :integer
  end
end
