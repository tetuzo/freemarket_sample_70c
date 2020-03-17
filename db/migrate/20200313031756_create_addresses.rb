class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :destination_family_name,        null: false
      t.string :destination_first_name,         null: false
      t.string :destination_family_name_kana,   null: false
      t.string :destination_first_name_kana,    null: false
      t.string :post_code,                     null: false
      t.string :prefecture,                     null: false
      t.string :municipality,                   null: false
      t.string :house_number,                   null: false
      t.string :building_name
      t.string :telephone_number
      t.references :user
      t.timestamps
    end
  end
end
