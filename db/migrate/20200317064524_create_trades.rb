class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
