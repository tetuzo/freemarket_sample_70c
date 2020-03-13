class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,            null: false
      t.text        :discription,     null: false   # 商品説明
      t.string      :status,          null: false
      t.integer     :price,           null: false
      t.string      :shipping_charges,null: false
      t.string      :shipping_days,   null: false  
      t.timestamps
    end
  end
end
