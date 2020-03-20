class RemoveTradeIdFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :trade_id, :integer
  end
end
