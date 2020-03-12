class AddBirthdayMonthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_month, :integer
  end
end
