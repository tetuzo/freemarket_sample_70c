class RemoveFamilyNameToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :family_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :family_name_kana, :string
    remove_column :users, :birthday_year, :integer
    remove_column :users, :birthday_month, :integer
    remove_column :users, :birthday_day, :integer
  end
end
